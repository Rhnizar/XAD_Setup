# Start from the base Ubuntu image
FROM ubuntu:20.04

# Update package list and install base dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    lsb-release \
    software-properties-common \
    gnupg2 \
    ca-certificates

RUN apt-get install -y cmake

RUN apt-get install -y g++

RUN apt-get install -y git


# Download and add LLVM GPG key from a specific keyserver, then add the repository
# RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /usr/share/keyrings/llvm-snapshot-archive-keyring.gpg && \
#     echo "deb [signed-by=/usr/share/keyrings/llvm-snapshot-archive-keyring.gpg] http://apt.llvm.org/focal/ llvm-toolchain-focal-12 main" | tee /etc/apt/sources.list.d/llvm-toolchain-focal-12.list && \
#     apt-get update && \
#     apt-get install -y clang-12 && \
#     update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-12 100 && \
#     update-alternatives --set c++ /usr/bin/clang++-12 && \
#     rm -rf /var/lib/apt/lists/*  # Clean up

# Add Kitware repository key and install cmake
# RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor -o /usr/share/keyrings/kitware-archive-keyring.gpg && \
#     DISTRO=$(lsb_release -c | awk '{print $2}') && \
#     echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ $DISTRO main" | tee /etc/apt/sources.list.d/kitware.list && \
#     apt-get update && \
#     apt-get install -y cmake && \
#     rm -rf /var/lib/apt/lists/*  # Clean up

# Create a work directory in the container (this can be replaced with a volume mount)
RUN mkdir -p /work_dir

# Set the default command to bash
CMD ["bash"]
