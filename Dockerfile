FROM python

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

RUN pip install -r requirements.txt

ENTRYPOINT ["uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "8000"]