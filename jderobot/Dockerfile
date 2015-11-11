FROM ubuntu:14.04
MAINTAINER Maykel Moya <mmoya@mmoya.org>

ADD etc/apt/apt.conf.d/99local /etc/apt/apt.conf.d/99local

RUN \
  sed -i -e 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  sed -i /^deb-src/d /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install \
	bash-completion \
	build-essential \
	curl \
	git \
	htop \
	man \
	openssh-client \
	software-properties-common \
	tree \
	unzip \
	vim \
	wget && \
  rm -rf /var/lib/apt/lists/*

# create jderobot user
RUN mkdir /home/jderobot && \
    groupadd -g 1000 jderobot && \
    useradd -g 1000 -M -s /bin/bash -u 1000 jderobot && \
    echo "jderobot ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/jderobot && \
    chmod 0440 /etc/sudoers.d/jderobot

# add osrf sources
RUN echo deb http://packages.osrfoundation.org/gazebo/ubuntu trusty main >/etc/apt/sources.list.d/gazebo.list && \
    curl -s http://packages.osrfoundation.org/gazebo.key | apt-key add -

# add pcl sources
RUN add-apt-repository ppa:v-launchpad-jochen-sprickerhof-de/pcl

# add jderobot sources
RUN echo deb http://jderobot.org/apt trusty main >/etc/apt/sources.list.d/jderobot.list && \
    curl -s http://jderobot.org/apt/jderobot-key.asc | apt-key add -

# install dependencies
RUN apt-get update && \
    apt-get -y install jderobot-deps libqt4-opengl-dev

# cleanup
RUN apt-get -y clean

ENV HOME /home/jderobot
WORKDIR /home/jderobot

CMD ["bash"]
