from google.cloud import storage
from google.oauth2 import service_account
import pandas as pd
import os
import time 
from io import BytesIO
import requests

# Credentials for GCS service account
try:
    credentials = service_account.Credentials.from_service_account_file(r"C:\Users\16466\Desktop\cis4400Team10-1\scripts\Connection String\deteamproject-40bfde088380.json")
    storage_client = storage.Client(credentials=credentials)
    print("GCS client initialized successfully.")
except Exception as e:
    print(f"Error initializing GCS client: {e}")

# Function to upload a file to the GCS bucket
def upload_blob(bucket_name, data, destination_blob_name):
    try:
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)

        data.seek(0)
        blob.upload_from_file(data, content_type='application/octet-stream')
        print(f"Data uploaded to {destination_blob_name} successfully.")
    except Exception as e:
        raise RuntimeError(f"Failed to upload data to {destination_blob_name}: {e}")


# List of file URLs and corresponding names for CSV files
file_urls = [
    #fhv
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-07.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-08.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-09.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-10.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-11.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-12.parquet',
    #hv
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-07.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-08.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-09.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-10.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-11.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-12.parquet',
    #yellow
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-07.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-08.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-09.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-10.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-11.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-12.parquet',
    #green
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-07.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-08.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-09.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-10.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-11.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2023-12.parquet'


]

file_names = [
    'fhv_july.parquet',
    'fhv_august.parquet',
    'fhv_september.parquet',
    'fhv_october.parquet',
    'fhv_november.parquet',
    'fhv_december.parquet',

    'hv_july.parquet',
    'hv_august.parquet',
    'hv_september.parquet',
    'hv_october.parquet',
    'hv_november.parquet',
    'hv_december.parquet',

    'yellow_july.parquet',
    'yellow_august.parquet',
    'yellow_september.parquet',
    'yellow_october.parquet',
    'yellow_november.parquet',
    'yellow_december.parquet',

    'green_july.parquet',
    'green_august.parquet',
    'green_september.parquet',
    'green_october.parquet',
    'green_november.parquet',
    'green_december.parquet'

]

# Process each file URL
for url, file_name in zip(file_urls, file_names):
    try:
        response = requests.get(url)
        response.raise_for_status()  

        data = BytesIO(response.content)
        upload_blob("de-team-project-bucket", data, file_name)
    except Exception as e:
        print(f"Error with file {file_name}: {e}")
