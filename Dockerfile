FROM python:3.6-alpine

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN apt update \
    apt upgrade \
    apt install libpq-dev python-dev \
    apt install uvicorn \
    pip install --upgrade wheel \
    pip install --upgrade setuptools \
    pip install psycopg2 \
    pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]
