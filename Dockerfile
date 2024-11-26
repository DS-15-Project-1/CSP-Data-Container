# Start with the base image
FROM python:3.12-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install wheel
RUN python -m pip install --upgrade pip wheel setuptools

# Install pip packages
RUN pip install \
    jupyterlab \
    pandas \
    pyarrow \
    numpy \
    matplotlib \
    scipy \
    nltk

# Download NLTK data
RUN python -c "import nltk; nltk.download('wordnet'); nltk.download('punkt'); nltk.download('stopwords')"

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
