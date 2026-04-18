FROM debian:latest

# Install sudo and basics
RUN apt update && apt install -y sudo curl git
RUN rm -rf /var/lib/apt/lists/* 

# Create user
RUN useradd -m -s /bin/bash dev && \
    echo "dev:123456" | chpasswd && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to user
USER dev
WORKDIR /home/dev

# Run installer
CMD ["bash"]
