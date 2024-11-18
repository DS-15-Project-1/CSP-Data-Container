## Project Structure

- Dockerfile: Contains the instructions for building the Docker image.
- docker-compose.yml: Defines the services and configuration for running the container.
- src/main.py: The main Python script that reads and processes the data from the server container.
- src/**init**.py: Initializes the src package.
- .gitignore: Specifies files and directories that Git should ignore.
- README.md: Project documentation.

## Connecting to the Server Container

The client container is designed to connect to the server container running on the same network. Make sure both containers are running and on the same Docker network.

To access the processed data from the server container, use the following URL in your code:

python http://obspy-dask-container:80/processed_data.csv

This setup provides a streamlined environment for analyzing the processed CO2 sequestration data using JupyterLab and Dask.
