from io import StringIO
from google.cloud import storage
from google.oauth2 import service_account
import pandas as pd
import os

# Credentials for GCS service account
try:
    credentials = service_account.Credentials.from_service_account_file(r"C:\Users\16466\Desktop\Private Key for team project\deteamproject-40bfde088380.json")
    storage_client = storage.Client(credentials=credentials)
    print("GCS client initialized successfully.")
except Exception as e:
    print(f"Error initializing GCS client: {e}")

# Load the dataset from the provided URL
try:
    df = pd.read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-08.parquet')
    print("Dataset loaded successfully.")
except Exception as e:
    print(f"Error loading dataset: {e}")

# Save the DataFrame to a CSV file
csv_file_path = 'fhv_august.csv'
try:
    df.to_csv(csv_file_path)
    print(f"CSV file saved to {csv_file_path}.")
except Exception as e:
    print(f"Error saving CSV file: {e}")

# Function to upload a file to the GCS bucket
def upload_blob(bucket_name, source_file_name, destination_blob_name):
    try:
        if not os.path.exists(source_file_name):
            print(f"File {source_file_name} does not exist.")
            return
        
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)
        blob.upload_from_filename(source_file_name)
        print(f"File {source_file_name} uploaded to {destination_blob_name}.")
    except Exception as e:
        print(f"Failed to upload file: {e}")

# Call the upload function with the appropriate arguments

try:
    upload_blob("de-team-project-bucket", csv_file_path, "destination-blob")
except Exception as e:
    print(f"Error in upload process: {e}")


#fhv_july...DONE
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_2023-07.parquet

#fhv_august
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-08.parquet

#fhv_september
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-09.parquet

#fhv_october
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-10.parquet

#fhv_november
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-11.parquet

#fhv_december
#https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-12.parquet
