import dask.dataframe as dd
import pandas as pd
import requests

def main():
    # Read data from the server container
    server_url = "http://your-server-public-ip:80/processed_data.csv"
    response = requests.get(server_url)
    
    # Save the CSV content to a file
    with open("/notebooks/processed_data.csv", "wb") as f:
        f.write(response.content)
    
    print(f"Data saved to /notebooks/processed_data.csv")

if __name__ == "__main__":
    main()
