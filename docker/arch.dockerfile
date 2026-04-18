FROM archlinux:latest

RUN pacman -Sy --noconfirm sudo curl git && pacman -Scc --noconfirm

RUN useradd -m -s /bin/bash dev && \
    echo "dev:123456" | chpasswd && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER dev
WORKDIR /home/dev

CMD ["bash"]
