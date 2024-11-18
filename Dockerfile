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
    textblob \
    nltk \
    ipykernel \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    scipy \
    plotly \
    requests \
    beautifulsoup4 \
    pillow \
    sqlalchemy \
    google-cloud-bigquery \
    google-auth-oauthlib \
    google-auth-httplib2 \
    google-api-python-client \
    tensorflow \
    keras \
    torch \
    torchvision \
    torchaudio \
    opencv-python \
    ffmpeg-python \
    librosa \
    pydub \
    youtube-dl \
    tqdm \
    ipywidgets \
    widgetsnbextension \
    ipympl \
    xgboost \
    JupyterLab \
    jupyterlab-git \
    dask

# Update TextBlob and install NLTK
RUN pip install --no-cache-dir --upgrade textblob nltk

# Download NLTK data and TextBlob corpora
RUN python -c "import nltk; nltk.download('wordnet'); nltk.download('averaged_perceptron_tagger'); nltk.download('punkt'); nltk.download('stopwords'); nltk.download('omw-1.4')"
RUN python -m textblob.download_corpora

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
