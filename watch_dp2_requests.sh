#!/bin/bash

tmux send 'ffs_env && ros2 topic echo dispenser_requests' ENTER;
tmux split-window  -v
tmux send 'ffs_env && ros2 topic echo door_requests' ENTER;
tmux split-window -v 
tmux send 'ffs_env && ros2 topic echo lift_requests' ENTER;
tmux split-window -v 
tmux send 'ffs_env && ros2 topic echo robot_path_requests' ENTER;
tmux select-layout even-horizontal
