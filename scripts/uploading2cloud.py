from google.cloud import storage
from google.oauth2 import service_account
import pandas as pd
import os
import time 

# Credentials for GCS service account
try:
    credentials = service_account.Credentials.from_service_account_file(r"C:\Users\16466\Desktop\cis4400Team10-1\scripts\Connection String\deteamproject-40bfde088380.json")
    storage_client = storage.Client(credentials=credentials)
    print("GCS client initialized successfully.")
except Exception as e:
    print(f"Error initializing GCS client: {e}")

# Function to upload a file to the GCS bucket
def upload_blob(bucket_name, source_file_name, destination_blob_name, chunk_size=10485760):
    start_time = time.time()
    try:
        if not os.path.exists(source_file_name):
            print(f"File {source_file_name} does not exist.")
            return
        
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.chunk_size = chunk_size  

        with open(source_file_name, 'rb') as file_data:
            blob.upload_from_file(file_data)
        
        print(f"File {source_file_name} uploaded to {destination_blob_name}.")
    except Exception as e:
        print(f"Failed to upload file: {e}")

    end_time = time.time()  
    print(f"Upload time: {end_time - start_time} seconds")

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
    'fhv_july.csv',
    'fhv_august.csv',
    'fhv_september.csv',
    'fhv_october.csv',
    'fhv_november.csv',
    'fhv_december.csv',

    'hv_july.csv',
    'hv_august.csv',
    'hv_september.csv',
    'hv_october.csv',
    'hv_november.csv',
    'hv_december.csv',

    'yellow_july.csv',
    'yellow_august.csv',
    'yellow_september.csv',
    'yellow_october.csv',
    'yellow_november.csv',
    'yellow_december.csv',

    'green_july.csv',
    'green_august.csv',
    'green_september.csv',
    'green_october.csv',
    'green_november.csv',
    'green_december.csv'

]

# Process each file URL
for url, file_name in zip(file_urls, file_names):
    try:
        # Load the dataset from the provided URL
        df = pd.read_parquet(url)
        print(f"Dataset loaded successfully from {url}.")

        # Save the DataFrame to a CSV file
        csv_file_path = file_name
        df.to_csv(csv_file_path)
        print(f"CSV file saved to {csv_file_path}.")

        # Call the upload function with the appropriate arguments
        upload_blob("de-team-project-bucket", csv_file_path, file_name)
    except Exception as e:
        print(f"Error with file {file_name}: {e}")

