FROM mmoya/jderobot-dev-base
MAINTAINER Maykel Moya <mmoya@mmoya.org>

RUN \
# install useful packages
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y --no-install-recommends install \
        bash-completion \
        build-essential \
        gdb \
        git \
        htop \
        libgl1-mesa-dri \
        man \
        mesa-utils \
        openssh-client \
        strace \
        tmux \
        tree \
        unzip \
        vim \
        wget && \
# create users and groups
    groupadd -g 91 video-arch && \
    useradd -G video-arch -m -s /bin/bash -u 1000 jderobot && \
    echo "jderobot ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/jderobot && \
    chmod 0440 /etc/sudoers.d/jderobot

ENV LANG C.UTF-8
ENV HOME /home/jderobot
ENV USER jderobot
WORKDIR /home/jderobot

CMD ["bash"]
