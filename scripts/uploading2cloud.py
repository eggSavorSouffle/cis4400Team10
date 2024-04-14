from io import StringIO
from google.cloud import storage
from google.oauth2 import service_account
import pandas as pd 

# Credentials for your GCS service account
credentials = service_account.Credentials.from_service_account_file(r"C:\Users\16466\Desktop\Private Key for team project\deteamproject-40bfde088380.json")

# GCS client with your credentials
storage_client = storage.Client(credentials=credentials)

# Load the dataset from the provided URL
df = pd.read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/fhv_tripdata_2023-07.parquet')

# Save the DataFrame to a CSV file
csv_file_path = 'fhv.csv'
df.to_csv(csv_file_path)

# Function to upload a file to the GCS bucket
def upload_blob(bucket_name, source_file_name, destination_blob_name):
    """Uploads a file to the bucket."""
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    # Optional: set a generation-match precondition to avoid potential race conditions
    generation_match_precondition = 0
    blob.upload_from_filename(source_file_name, if_generation_match=generation_match_precondition)

    print(f"File {source_file_name} uploaded to {destination_blob_name}.")

# Call the upload function with the appropriate arguments
upload_blob("de-team-project-bucket", csv_file_path, "destination-blob")
