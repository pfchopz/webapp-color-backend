FROM ubuntu:20.04

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install libpq-dev python-dev -y
RUN apt-get install uvicorn -y
RUN pip install --upgrade wheel
RUN pip install --upgrade setuptools
RUN pip install psycopg2
RUN pip install -r requirements.txt

ENTRYPOINT ["python3", "-m", "uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]
