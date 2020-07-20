FROM ubuntu:20.04

LABEL maintainer="alfonder"

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND="noninteractive"
#ENV TERM="xterm"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      software-properties-common python3-software-properties \
      apt-utils curl wget pkg-config unzip \
      sudo lsb-release pciutils cpio \
      build-essential sudo git \
      file unzip xz-utils rsync bc flex bison pkg-config \
      libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev \
      chrpath gawk texinfo libsdl1.2-dev \
      openssl libssl-dev libncurses-dev \
      vim openssh-client openssh-server

RUN apt-get install -y python3 python3-pip python3-wheel && \
    pip3 install pip --upgrade && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Use already downloaded sources
# COPY sources/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz /tmp
# COPY sources/linux-5.5.tar.xz /tmp
# COPY sources/2019.08.3.tar.gz /tmp
# RUN cd /tmp && \
#     mkdir -p /ws && \
#     \
#     tar -xf gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz -C /ws/ && \
#     \
#     tar -xf linux-5.5.tar.xz -C /ws/ && \
#     \
#     tar -xf 2019.08.3.tar.gz -C /ws/

# Download and extract sources

ENV WORKSPACE="/workspaces"
ENV LINUX_HOME="$WORKSPACE/linux"

RUN cd /tmp && \
    mkdir -p ${WORKSPACE} && \
    mkdir -p ${LINUX_HOME}

WORKDIR ${WORKSPACE}

RUN apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

VOLUME ${LINUX_HOME}
CMD "/bin/bash"
