FROM python

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install libpq-dev python-dev
RUN apt-get install uvicorn
RUN pip install --upgrade wheel
RUN pip install --upgrade setuptools
RUN pip install psycopg2
RUN pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]
