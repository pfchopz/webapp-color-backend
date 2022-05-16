FROM python:3.6-alpine

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "backend.py"]
