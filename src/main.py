import os
import requests
from urllib.parse import urljoin

def download_files(server_url, local_directory):
    # Ensure the local directory exists
    os.makedirs(local_directory, exist_ok=True)

    # Fetch the directory listing from the server
    response = requests.get(server_url)
    if response.status_code != 200:
        print(f"Failed to fetch directory listing from {server_url}")
        return

    # Parse the HTML to extract file links
    from bs4 import BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')
    file_links = [a['href'] for a in soup.find_all('a', href=True) if a['href'].endswith(('.csv', '.parquet', '.feather', '.json'))]

    # Download each file
    for file_link in file_links:
        file_url = urljoin(server_url, file_link)
        file_path = os.path.join(local_directory, file_link)
        
        response = requests.get(file_url, stream=True)
        if response.status_code == 200:
            with open(file_path, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            print(f"Downloaded: {file_link}")
        else:
            print(f"Failed to download: {file_link}")

if __name__ == "__main__":
    server_url = "http://129.138.10.44:8080/"  # Replace with your server URL
    local_directory = "./output"  # Replace with your desired local directory
    
    download_files(server_url, local_directory)
