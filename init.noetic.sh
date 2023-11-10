#xhost +

docker run \
 --rm -it \
 --env=DISPLAY \
 --env=QT_X11_NO_MITSHM=1 \
 --env=RMW_IMPLEMENTATION=rmw_cyclonedds_cpp \
 --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
 --volume=/run/user/1000/gdm/Xauthority:/root/.Xauthority \
 --net=host \
 --gpus=all \
 --runtime=nvidia \
  noetic_test:v2 