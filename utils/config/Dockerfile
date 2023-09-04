# Use the official Ubuntu base image from Docker Hub
FROM ubuntu:latest

# Update package lists and install any desired packages
RUN apt-get update && apt-get upgrade -y\
    && apt-get install -y git curl sudo software-properties-common

# Add a new user named "myuser" with the UID and GID of 1000
RUN useradd -m -u 1000 test

# Set the password for the new user (optional but recommended)
RUN echo 'test:test' | chpasswd

# Grant sudo privileges to the new user
RUN usermod -aG sudo test

# Switch to the new user
USER test

# Set the working directory for the new user (optional but recommended)
WORKDIR /home/test

RUN git clone https://github.com/corneliu-rotari/scripts.git
