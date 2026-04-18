FROM fedora:latest

RUN dnf install -y sudo curl git && dnf clean all

RUN useradd -m -s /bin/bash dev && \
    echo "dev:123456" | chpasswd && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["bash"]
