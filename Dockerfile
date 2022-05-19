FROM python:3.6-alpine

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN pip install -r requirements.txt

ENTRYPOINT ["python3", "-m", "uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]