FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

# Required Packages for the Host Development System
# https://buildroot.uclibc.org/downloads/manual/manual.html#requirement
# "which" provided by debianutils
# "scp" provided by openssh-client
RUN apt-get install -y build-essential bash bc binutils \
                       bzip2 gzip tar cpio unzip \
                       perl rsync wget file patch \
                       g++ gcc make sed debianutils \
                       bison flex \
                       # Optional packages
                       python3 libncurses5 libncurses5-dev \
                       git openssh-client subversion mercurial \
                       # Misc packages (TODO: figure needed)
                       libdevmapper-dev libsystemd-dev \
                       vim nano libssl-dev libfdt-dev \
                       parted zip kmod apt-file \
                       iproute2 iptables

# Sometimes Buildroot needs proper locale, e.g. when using a toolchain based on glibc.
RUN apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
        echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
        dpkg-reconfigure --frontend=noninteractive locales && \
        update-locale LANG=en_US.UTF-8

# Create a non-root user that will perform the actual build
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build
RUN apt-get install -y sudo && usermod -a -G sudo build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers
RUN echo "alias ll='ls -la'\nalias llh='ls -lha'" >> /home/build/.bashrc

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER build
WORKDIR /home/build
ENV O=/home/build/output
CMD "/bin/bash"

# EOF
