FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    vim \
    sudo \
    libgl1 \
    build-essential \
    && apt-get clean

WORKDIR /opt

# Miniforge install
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh \
    && bash Miniforge3-Linux-aarch64.sh -b -p /opt/conda \
    && rm Miniforge3-Linux-aarch64.sh

ENV PATH=/opt/conda/bin:$PATH

# mamba install
RUN conda install -y mamba -n base -c conda-forge

WORKDIR /tmp

# environment install
COPY environment.yml .

RUN mamba env create -f environment.yml \
    && mamba clean -afy

RUN mkdir -p /work
WORKDIR /work

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--ServerApp.token=''"]