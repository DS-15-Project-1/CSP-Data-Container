## Project Structure

- Dockerfile: Contains the instructions for building the Docker image.
- docker-compose.yml: Defines the services and configuration for running the container.
- src/main.py: The main Python script that reads and saves the data from the server container.
- src/**init**.py: Initializes the src package.
- README.md: Project documentation.

## Connecting to the Server Container

The client container is designed to connect to a remote server container. Make sure you have the public IP address or domain name of the server container.

To access the processed data from the server container, use the following URL in your code:

python http://your-server-public-ip:80/processed_data.csv

Replace `your-server-public-ip` with the actual public IP address or domain name of your server.

This setup provides a streamlined environment for retrieving and saving the processed CO2 sequestration data from a remote server.
