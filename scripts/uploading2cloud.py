from google.cloud import storage
from google.oauth2 import service_account

credentials = service_account.Credentials.from_service_account_file(r"C:\Users\16466\Desktop\cis4400Team10\cis4400Team10\scripts\Private Key\deteamproject-40bfde088380.json")
storage_client = storage.Client(credentials=credentials)


def upload_blob(bucket_name, source_file_name, destination_blob_name):
    """Uploads a file to the bucket."""
    # The ID of your GCS bucket
    bucket_name = "de-team-project-bucket"
    # The path to your file to upload
    source_file_name = r"C:\Users\16466\Desktop\cis4400Team10\cis4400Team10\data\fhv_tripdata_2023-07.parquet"
    # The ID of your GCS object
    destination_blob_name = "de-team-project-bucket"
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    # Optional: set a generation-match precondition to avoid potential race conditions
    # and data corruptions. The request to upload is aborted if the object's
    # generation number does not match your precondition. For a destination
    # object that does not yet exist, set the if_generation_match precondition to 0.
    # If the destination object already exists in your bucket, set instead a
    # generation-match precondition using its generation number.
    generation_match_precondition = 0

    blob.upload_from_filename(source_file_name, if_generation_match=generation_match_precondition)

    print(f"File {source_file_name} uploaded to {destination_blob_name}.")



upload_blob("de-team-project", r"C:\Users\16466\Desktop\cis4400Team10\cis4400Team10\data\fhv_tripdata_2023-07.parquet", "modified-shape-418121")
