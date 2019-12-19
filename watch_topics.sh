#!/bin/bash

tmux send 'ffs_env && ros2 topic echo dispenser_states' ENTER;
tmux split-window  -v
tmux send 'ffs_env && ros2 topic echo door_states' ENTER;
tmux split-window -v 
tmux send 'ffs_env && ros2 topic echo lift_states' ENTER;
tmux split-window -v 
tmux send 'ffs_env && ros2 topic echo fleet_states' ENTER;
tmux select-layout even-horizontal
