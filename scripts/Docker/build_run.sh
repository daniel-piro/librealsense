#! /bin/sh

# This script shows how to build and run a librealsense docker container
# Build the image and tag it as librealsense:local
docker build --tag librealsense:local .

# By using --device-cgroup-rule flag we grant the docker continer permissions -
# to the camera and usb endpoints of the machine.
# It also mounts the /dev directory of the host platform on the contianer 
docker run -it --rm \
    -v /dev:/dev \
    --device-cgroup-rule "c 81:* rmw" \
    --device-cgroup-rule "c 189:* rmw" \
    librealsense:local
