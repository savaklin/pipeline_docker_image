FROM ubuntu:21.04

WORKDIR /tools

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Updating paths to tools
ENV PATH="/tools:${PATH}"

# Install basics
RUN apt-get update \
    && apt-get install curl zip unzip \
    # Install Python and common modules
    && apt update \
    && apt install python3.9 python3-pip \
    && pip install --no-cache datetime az.cli opencensus.ext.azure azure-functions azure-devops termcolor pprint