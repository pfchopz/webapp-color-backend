from fastapi import FastAPI
from sqlalchemy import create_engine
import os

# Create FastAPI object
app = FastAPI()

# Get Database Server IP as Environment Variable
DB_SERVER= os.environ.get('DB_SERVER')
DB_USER= os.environ.get('DB_USER')
DB_PASS= os.environ.get('DB_PASS')

# Create PostGres DB connection and pull message data
engine = create_engine(f"postgresql://{DB_USER}:{DB_PASS}@{DB_SERVER}:5432/postgres")
with engine.connect() as conn:
    data = conn.execute("SELECT message FROM data")
    for entry in data:
        dbdata = entry

@app.get("/message")
async def root():
    with engine.connect() as conn:
        data = conn.execute("SELECT messages FROM data")
        for entry in data:
            dbdata = entry

    return dbdata['message']