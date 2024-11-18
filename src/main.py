import dask.dataframe as dd
import pandas as pd

def main():
    # Read data from the server container
    ddf = dd.read_csv("http://obspy-dask-container:80/processed_data.csv")
    
    # Perform any necessary data processing
    # For example:
    # ddf = ddf.dropna()
    # ddf = ddf.rename(columns={'old_name': 'new_name'})
    
    # Convert to pandas DataFrame for further analysis
    df = ddf.compute()
    
    # Perform your analysis here
    # For example:
    # result = df.describe()
    # print(result)
    
    # Optionally, save the processed data
    df.to_csv("/notebooks/processed_data.csv", index=False)

if __name__ == "__main__":
    main()
