FROM ubuntu:22.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt update && apt -y install sudo build-essential cmake gdb nasm pkg-config git
RUN apt update && apt -y install curl zip unzip tar python3 bison libx11-dev libxft-dev libxext-dev autoconf libtool libxrandr-dev libxi-dev
RUN apt update && apt -y install libxcursor-dev libxdamage-dev libxinerama-dev libdrm-dev

# Create a non-root user
ARG UID=1000
RUN useradd -m -u ${UID} -s /bin/bash builder
RUN adduser builder sudo

# Ensure sudo group users are not
# asked for a password when using;
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

USER builder
