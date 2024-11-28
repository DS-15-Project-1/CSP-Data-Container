# Client Project for CO2 Sequestration Data Analysis

This project provides a client-side environment for analyzing CO2 sequestration data processed by the server container.

## Setup

- Clone the repository
- Run `docker-compose up --build`
- Build the Docker image if it hasn't been built before.
- Start a container from this image.
- Run Jupyter Lab inside the container.
- Make Jupyter Lab accessible on http://localhost:8888 on your host machine.

## Usage

When you run this container using docker-compose up, it will:

- To access the Jupyter notebook:
- Run docker-compose up in the directory containing your docker-compose.yml file.
- go to the terminal inside of your container with docker exec -it client-jupyter /bin/bash and type "jupyter server list"
- Open a web browser and go to http://localhost:8888/?token=your_token_here (replace wit token= from the output of your "jupyter server list" command)
- You should see the Jupyter Lab interface where you can access the seismic data fromt the "notebooks" directory.

## Project Structure

- Dockerfile: Contains the instructions for building the Docker image.
- docker-compose.yml: Defines the services and configuration for running the container.

- df_access.py allows your to read the data from parquet files