FROM python:3.12-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /notebooks

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    git \
    build-essential \
    libssl3 \
    libgl1-mesa-glx \
    libqt5gui5 \
    libnotify4 \
    libnss3 \
    xdg-utils \
    x11-apps \
    xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install wheel
RUN python -m pip install --upgrade pip wheel setuptools

# Install additional packages
RUN pip install --no-cache-dir \
    dask \
    pandas \
    numpy \
    requests

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
