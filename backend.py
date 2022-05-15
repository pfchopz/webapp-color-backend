from fastapi import FastAPI
from sqlalchemy import create_engine
import os

# Create FastAPI object
app = FastAPI()

# Get Database Server IP as Environment Variable
DB_SERVER_IP = os.environ.get('DB_SERVER_IP')

# Create PostGres DB connection and pull message data
engine = create_engine(f"postgresql://dan:password@{DB_SERVER_IP}:5432/postgres")
with engine.connect() as conn:
    data = conn.execute("SELECT message FROM data")
    for entry in data:
        dbdata = entry

@app.get("/message")
async def root():
    return dbdata['message']