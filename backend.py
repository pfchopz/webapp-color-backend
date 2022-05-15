from fastapi import FastAPI
from sqlalchemy import create_engine

# Create FastAPI object
app = FastAPI()

# Create PostGres DB connection and pull message data
engine = create_engine("postgresql://dan:password@localhost:5432/postgres")
with engine.connect() as conn:
    data = conn.execute("SELECT message FROM data")
    for entry in data:
        dbdata = entry

@app.get("/message")
async def root():
    return dbdata['message']