FROM noetic_tools:0.0

RUN apt-get update \
 && apt install -y \
 ros-${ROS_DISTRO}-navigation \
 ros-${ROS_DISTRO}-dwa-local-planner \
 ros-${ROS_DISTRO}-teb-local-planner \
 ros-${ROS_DISTRO}-robot-localization \
 ros-${ROS_DISTRO}-rtabmap \
 ros-${ROS_DISTRO}-rtabmap-ros \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p Sasa/src

WORKDIR Sasa/

RUN git clone https://github.com/stereolabs/zed-ros-wrapper.git src/zed-ros-wrapper  \
 && git clone https://github.com/Sapienza-Technology/tasks_utils.git src/tasks_utils 

RUN rosdep install --from-path src --ignore-src -r -y \
 && /bin/bash -c '. /opt/ros/noetic/setup.bash; \
                    catkin_make -DCMAKE_BUILD_TYPE=Release; \
                    source devel/setup.bash'

 


RUN mkdir ../../my_pkg
WORKDIR ../../my_pkg
RUN mkdir -p src/my_pkg \
 && touch src/__init__.py README.md \
 && mkdir src/test
 
# /tmp/.X11-unix:/tmp/.X11-unix:rw
#/run/user/1000/gdm/Xauthority:/root/.Xauthority
# QT_X11_NO_MITSHM=1