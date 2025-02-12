FROM ubuntu:20.04
MAINTAINER Longan "Longan Team"
ENV DEBIAN_FRONTEND noninteractive

# First setup basic tools and architecture support
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    dpkg --add-architecture armhf && \
    apt-get update -y

RUN apt-get install -y python3-pip && pip install pycrypto

# Install core development packages without ARM specific ones first
RUN apt-get update -y && apt-get install -y \
    openjdk-8-jdk \
    python \
    git-core \
    gnupg \
    flex \
    bison \
    gperf \
    build-essential \
    zip \
    curl \
    gawk \
    liblz4-tool \
    zlib1g-dev \
    gcc-multilib \
    g++-multilib \
    libc6-dev-i386 \
    libncurses5 \
    lib32ncurses5-dev \
    x11proto-core-dev \
    libx11-dev \
    lib32z-dev \
    ccache \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    mtools \
    u-boot-tools \
    htop \
    iotop \
    sysstat \
    iftop \
    pigz \
    bc \
    device-tree-compiler \
    lunzip \
    dosfstools \
    vim-common \
    parted \
    udev \
    libssl-dev \
    sudo \
    rsync \
    python3-pyelftools \
    cpio \
    clang \
    busybox \
    lsof \
    kmod \
    libelf-dev

ENV USER=longanpi
ARG USER_ID=0
ARG GROUP_ID=0

RUN groupadd -g ${GROUP_ID} longanpi && useradd -m -g longanpi -u ${USER_ID} longanpi
RUN sed -i -e '/\%sudo/ c \%sudo ALL=(ALL) NOPASSWD: ALL' /etc/sudoers
RUN usermod -a -G sudo longanpi
RUN echo 'root:root' | chpasswd
RUN echo 'longanpi:longanpi' | chpasswd

USER longanpi
