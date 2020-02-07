#!/bin/bash


set -e

export ROS_IP=10.233.29.76  # Your IP HERE
gnome-terminal -- bash -c "echo 'Launching $1'; ssh $1; exec bash"
export ROS_MASTER_URI=http://$1.local:11311
source /opt/ros/melodic/setup.bash
rviz 
