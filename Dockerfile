FROM ubuntu:20.04

ARG TEXLIVE_VERSION=2022

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes
ENV PATH="/usr/local/texlive/bin:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    make \
    wget \
    python3 \
    libfontconfig1-dev \
    libfreetype6-dev \
    ghostscript \
    perl \
    git \
    poppler-utils \
    ttf-mscorefonts-installer && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y \
    texlive-full \
    texlive-extra-utils && \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

COPY .latexmkrc /
COPY .latexmkrc /root/