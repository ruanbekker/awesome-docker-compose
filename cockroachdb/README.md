# cockroachdb

Docker Compose for cockroachdb

## About

[CockroachDB](https://www.cockroachlabs.com/) is a distributed SQL database built on a transactional and strongly-consistent key-value store which scales horizontally.

## Containers

| Name              | Description                | Port   |
| :---------------- | :------------------------: | -----: |
| cockroachdb       | web-ui port                | 8081   |
|                   | sql port                   | 26257  |

## Quickstart

Start cockroachdb:

```bash
make up
```

Set the connection string:

```bash
export DATABASE_URL="postgresql://root@localhost:26257/defaultdb?sslmode=disable"
```

Connect to the cluster:

```bash
docker exec -it cockroachdb-1 ./cockroach sql --host=cockroachdb-2:26258 --insecure
```

Run some queries:

```sql
CREATE DATABASE bank;
CREATE TABLE bank.accounts (id INT PRIMARY KEY, balance DECIMAL);
INSERT INTO bank.accounts VALUES (1, 1000.50);
SELECT * FROM bank.accounts;
```

To simulate some load:

```bash
pip install -r example/requirements.txt
python example/example_load.py
```

## Resources

- https://www.cockroachlabs.com/docs/
- https://www.cockroachlabs.com/docs/v24.2/start-a-local-cluster-in-docker-mac
