FROM python:3.10.12-slim

# Upgrade pip for better package management
RUN python3 -m ensurepip --upgrade

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    festival \
    git \
    nano \
    gcc \
    less \
    build-essential \
    libffi-dev \
    zlib1g-dev \
    liblzma-dev \
    libbz2-dev \
    libsqlite3-dev \
    wget \
    curl \ 
    llvm \
    portaudio19-dev \
    espeak \
    libportaudio2 \
    ffmpeg \
    libasound2-dev \
    pulseaudio \
    tini \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Continue with the rest of your Dockerfile, e.g. copying your source code
COPY . /usr/src/app

RUN pip3 install -r requirements.txt

RUN python -m nltk.downloader punkt

ENV PULSE_SERVER=docker.for.mac.localhost

ENTRYPOINT ["tini", "-g", "--"]
