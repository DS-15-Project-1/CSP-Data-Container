# Start with the base image
FROM continuumio/miniconda3

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory
WORKDIR /notebooks

# Update conda and install necessary packages
RUN conda update -n base -c defaults conda && \
    conda install -c conda-forge obspy jupyterlab pandas pyarrow numpy matplotlib scipy nltk -y && \
    conda clean --all -y

# Install additional packages via pip
RUN pip install --no-binary=:all: wheel setuptools

# Download NLTK data
RUN python -c "import nltk; nltk.download('wordnet'); nltk.download('punkt'); nltk.download('stopwords')"

# Install gcc and other build dependencies
RUN apt-get update && apt-get install -y gcc g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]