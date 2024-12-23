# Use Python 3.12 as the base image
FROM python:3.12-bullseye

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /notebooks

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libarchive13 \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install wheel
RUN python -m pip install --upgrade pip && \
    python -m pip install wheel

RUN python -m pip install \
    obspy \
    dask \
    dask[dataframe] \
    pandas \
    plotly \
    jupyter \
    jupyterlab \
    && rm -rf /usr/share/dict

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]