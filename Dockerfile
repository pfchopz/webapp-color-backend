FROM python

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN apt-get update \
    apt-get upgrade \
    apt-get install libpq-dev python-dev \
    apapt-getk install uvicorn \
    pip install --upgrade wheel \
    pip install --upgrade setuptools \
    pip install psycopg2 \
    pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]
