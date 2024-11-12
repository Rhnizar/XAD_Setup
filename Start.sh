#!/bin/bash

# Navigate to the ubuntu-container directory on the Desktop
cd ~/Desktop/Containers || { echo "Directory ~/Desktop/Containers not found"; exit 1; }

# Build the Docker container with the tag "ubuntu-dev-container"
echo "Building the Docker container..."
docker build -t ubuntu-dev-container .

# Run the container in interactive mode
echo "Running the Docker container..."
# docker run -it ubuntu-dev-container
docker run -it -v ./QuantLib-Risks-integration:/work_dir ubuntu-dev-container 




# Start from the base Ubuntu image
# FROM ubuntu:20.04

# # Update and install necessary dependencies including build tools
# RUN apt-get update && apt-get install -y \
#     wget \
#     lsb-release \
#     software-properties-common \
#     gnupg2 \
#     ca-certificates \
#     build-essential \       # Install build-essential for compilers
#     g++                      # Install g++ specifically for C++ compiling

# # Add Kitware repository key and the repository
# RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/kitware-archive-keyring.gpg \
#     && DISTRO=$(lsb_release -c | awk '{print $2}') \
#     && echo "deb https://apt.kitware.com/ubuntu/ $DISTRO main" | tee /etc/apt/sources.list.d/kitware.list \
#     && apt-get update \
#     && apt-get install -y cmake

# # Create a work directory in the container (this can be replaced with a volume mount)
# RUN mkdir -p /work_dir

# # Set the default command to bash
# CMD ["bash"]




