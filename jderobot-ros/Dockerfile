FROM mmoya/jderobot:latest
MAINTAINER Maykel Moya <mmoya@mmoya.org>

# install software
# add ros sources
RUN echo deb http://packages.ros.org/ros/ubuntu trusty main >/etc/apt/sources.list.d/ros.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-key 0xB01FA116 && \
# install dependencies
    apt-get update && \
    apt-get -y install ros-jade-desktop-full python-rosinstall && \
# initialize ros
    rosdep init && \
    sudo -u jderobot rosdep update && \
# cleanup
    rm -rf /var/lib/apt/lists/*
