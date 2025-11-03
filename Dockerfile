FROM python:3.8-slim-buster

WORKDIR /mlflow

RUN pip install mlflow psycopg2-binary boto3

EXPOSE 5111

CMD ["mlflow", "server", \
     "--host", "0.0.0.0", \
     "--port", "5111", \
     "--backend-store-uri", "postgresql://mlflow:mlflow@postgres/mlflow", \
     "--default-artifact-root", "s3://test-ccp-ml", \
     "--artifacts-destination", "s3://test-ccp-ml"]
