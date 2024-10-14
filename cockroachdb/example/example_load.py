import time
import psycopg2
import random
import logging
import sys

# Configure logging to use stdout
logging.basicConfig(
    level=logging.INFO,  # Set to INFO to log normal events, DEBUG for detailed logs
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.StreamHandler(sys.stdout)  # Log only to stdout
    ]
)

# Connect to CockroachDB
conn = psycopg2.connect(
    dbname="test_db",
    user="root",
    password="",
    host="localhost",
    port="26257",
    sslmode="disable"
)
cur = conn.cursor()

# Function to perform SQL operations
def simulate_load():
    try:
        logging.info("Starting load simulation for 60 seconds...")
        
        # Loop for 60 seconds
        start_time = time.time()
        while time.time() - start_time < 60:
            # Insert rows
            cur.execute(
                "INSERT INTO test_table (name, value) SELECT 'Load Test ' || generate_series(1, 10), floor(random()*100)::INT"
            )
            logging.info("Inserted 10 rows into test_table")

            # Update random rows
            cur.execute(
                "UPDATE test_table SET value = value + floor(random()*100)::INT WHERE id IN (SELECT id FROM test_table ORDER BY random() LIMIT 5)"
            )
            logging.info("Updated 5 random rows in test_table")

            # Delete random rows
            cur.execute(
                "DELETE FROM test_table WHERE id IN (SELECT id FROM test_table ORDER BY random() LIMIT 3)"
            )
            logging.info("Deleted 3 random rows from test_table")

            # Select some rows
            cur.execute(
                "SELECT * FROM test_table WHERE id IN (SELECT id FROM test_table ORDER BY random() LIMIT 10)"
            )
            cur.fetchall()  # Fetch results to complete the operation
            logging.info("Selected 10 random rows from test_table")

            # Commit after each iteration
            conn.commit()
            logging.info("Committed changes to the database")

            # Small delay to prevent overwhelming the system
            time.sleep(0.1)

        logging.info("Load simulation completed after 60 seconds")

    except Exception as e:
        logging.error(f"Error during load simulation: {e}")
    finally:
        cur.close()
        conn.close()
        logging.info("Database connection closed")

if __name__ == "__main__":
    simulate_load()

