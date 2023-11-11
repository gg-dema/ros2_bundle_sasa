ARG ROS_DISTRO=noetic
FROM osrf/ros:${ROS_DISTRO}-desktop-full

#min setup

RUN apt-get update; \
 apt install -y --no-install-recommends\
 git tree locales openssh-client; 

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc