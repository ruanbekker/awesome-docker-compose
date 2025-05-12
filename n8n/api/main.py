from fastapi import FastAPI, Depends, HTTPException, Request
from sqlalchemy.orm import Session
from pydantic import BaseModel
from database import Base, engine, SessionLocal
from models import Joke

import os
import logging
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

app = FastAPI()

# Logging
logging.basicConfig(level=logging.INFO)

# Create tables
Base.metadata.create_all(bind=engine)

# Serve static workflows
WORKFLOW_DIR = "workflows"
app.mount("/workflows", StaticFiles(directory=WORKFLOW_DIR), name="workflows")

# Pydantic schema
class JokeIn(BaseModel):
    content: str

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/jokes/")
async def create_joke(request: Request, db: Session = Depends(get_db)):
    # Read raw body
    raw_body = await request.body()
    logging.info(f"Raw body received: {raw_body.decode()}")

    # Try to parse it into your Pydantic model
    try:
        data = await request.json()
        logging.info(f"Parsed JSON: {data}")
        joke = JokeIn(**data)
    except Exception as e:
        logging.error(f"JSON parsing failed: {e}")
        return {"error": "Invalid JSON body"}

    db_joke = Joke(content=joke.content)
    db.add(db_joke)
    db.commit()
    db.refresh(db_joke)
    return {"id": db_joke.id, "content": db_joke.content}

