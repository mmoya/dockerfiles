FROM ubuntu:14.04
MAINTAINER Maykel Moya <mmoya@mmoya.org>

RUN \
# prepare environment
    sed -i /^deb-src/d /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
        wget && \
# add osrf sources list
    echo deb http://packages.osrfoundation.org/gazebo/ubuntu trusty main >/etc/apt/sources.list.d/gazebo.list && \
    wget -t 0 -c -S -O - http://packages.osrfoundation.org/gazebo.key | apt-key add - && \
# add pcl sources list
    echo deb http://ppa.launchpad.net/v-launchpad-jochen-sprickerhof-de/pcl/ubuntu trusty main >/etc/apt/sources.list.d/pcl.list && \
    apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys D51148574AAB18C259B43628D8A3751519274DEF && \
# add jderobot sources list
    echo deb http://jderobot.org/apt trusty main >/etc/apt/sources.list.d/jderobot.list && \
    wget -t 0 -c -S -O - http://jderobot.org/apt/jderobot-key.asc | apt-key add - && \
# install dependencies
    apt-get update && \
    apt-get -y --no-install-recommends install \
        jderobot-deps-dev \
        libqt4-opengl-dev \
        libqwt5-qt4-dev && \
# cleanup
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /home/jderobot
WORKDIR /home/jderobot

CMD ["bash"]
