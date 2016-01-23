FROM mmoya/jderobot-dev-base
MAINTAINER Maykel Moya <mmoya@mmoya.org>

RUN \
# install useful packages
    echo deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu trusty main > /etc/apt/sources.list.d/neovim.list && \
    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 9DBB0BE9366964F134855E2255F96FCF8231B6DD && \
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
        neovim \
        wget && \
# cleanup
    apt-get purge \
        vim-tiny && \
# create users and groups
    groupadd -g 91 video-arch && \
    useradd -G video-arch -M -s /bin/bash -u 1000 jderobot && \
    echo "jderobot ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/jderobot && \
    chmod 0440 /etc/sudoers.d/jderobot

ENV LANG C.UTF-8
ENV HOME /home/jderobot
ENV USER jderobot
WORKDIR /home/jderobot

CMD ["bash"]
