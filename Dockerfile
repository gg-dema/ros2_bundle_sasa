FROM osrf/ros:humble-desktop-full

#min setup
RUN apt-get update \
 && apt-get install -y locales lsb-release
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

RUN . /opt/ros/humble/setup.sh

# VOLUME /tmp/.X11-unix:/tmp/.X11-unix:rw
# VOLUME /run/user/1000/gdm/Xauthority:/root/.Xauthority
# ENV QT_X11_NO_MITSHM=1