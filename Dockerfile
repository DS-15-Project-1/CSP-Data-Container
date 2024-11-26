# Start with the base image
FROM continuumio/miniconda3:latest

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
    build-essential \
    xdg-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional packages using conda
RUN conda install --quiet --yes \
    'matplotlib-base' \
    'scipy' \
    'textblob' \
    nltk ipykernel numpy pandas matplotlib seaborn scikit-learn scipy plotly requests beautifulsoup4 pillow sqlalchemy==1.4.46 google-cloud-bigquery google-auth-oauthlib google-auth-httplib2 google-api-python-client tensorflow keras torch torchvision torchaudio opencv-python ffmpeg-python librosa pydub youtube-dl tqdm ipywidgets widgetsnbextension ipympl xgboost JupyterLab jupyterlab-git dask dask[dataframe] pyarrow==15.0.0  obspy && \
    conda clean --all -f -y

# Download NLTK data and TextBlob corpora
RUN python -c "import nltk; nltk.download('wordnet'); nltk.download('averaged_perceptron_tagger'); nltk.download('punkt'); nltk.download('stopwords'); nltk.download('omw-1.4')"
RUN python -m textblob.download_corpora

# Set the default command to run when starting the container
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
