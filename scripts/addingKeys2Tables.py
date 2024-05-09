from google.cloud import bigquery

# Initialize a BigQuery client
service_account_path = r'C:\Users\16466\Desktop\cis4400Team10-1\scripts\Connection String\deteamproject-40bfde088380.json' 
client = bigquery.Client.from_service_account_json(service_account_path)

tables = [
    ("deteamproject.dbt_xsouffront.dim_green", "green_id"),
    ("deteamproject.dbt_xsouffront.dim_yellow", "yellow_id"),
    ("deteamproject.dbt_xsouffront.dim_hv", "hv_id"),
    ("deteamproject.dbt_xsouffront.dim_base", "base_id"),
    ("deteamproject.dbt_xsouffront.dim_HighVolumeForServices", "hvfs_id")
]

def add_key(table_id, key_name):
    sql = f"""
    CREATE OR REPLACE TABLE `{table_id}` AS
    SELECT
        *,
        ROW_NUMBER() OVER() AS {key_name}
    FROM
        `{table_id}`
    """
    query_job = client.query(sql) 
    query_job.result()  
    print(f"Added key {key_name} to {table_id}")

# Looping over the tables and keys
for table_id, key_name in tables:
    add_key(table_id, key_name)
