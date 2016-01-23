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
        ca-certificates \
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
# install neovim python package
    wget -t 0 -c -O - https://bootstrap.pypa.io/get-pip.py | python2 && \
    pip install neovim && \
# cleanup
    apt-get -y --no-install-recommends purge \
        vim-tiny

ENV LANG C.UTF-8

# to be soft linked from YouCompleteMe/third_party/ycmd
COPY ycm_client_support.so.Ubuntu /usr/local/lib/ycm_client_support.so
COPY ycm_core.so.Ubuntu /usr/local/lib/ycm_core.so

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]
