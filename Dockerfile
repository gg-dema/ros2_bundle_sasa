ARG ROS_DISTRO=noetic
FROM osrf/ros:${ROS_DISTRO}-desktop-full

#min setup
RUN apt-get update \
 && apt-get install -y \
 locales \
 lsb-release \
 tree 

ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales



#RUN mkdir -p ss_aachem/src

#WORKDIR ./ss_aachem/src
#RUN  git clone -b eloquent-devel https://git.fh-aachen.de/Wiesen/rqt_joy \
# && cd .. \
# && colcon build

# WORKDIR ../

#ENTRYPOINT ["./../ros_entrypoint.sh"]

#RUN . /opt/ros/humble/setup.sh


# to pass as sh var 

# /tmp/.X11-unix:/tmp/.X11-unix:rw
#/run/user/1000/gdm/Xauthority:/root/.Xauthority
# QT_X11_NO_MITSHM=1