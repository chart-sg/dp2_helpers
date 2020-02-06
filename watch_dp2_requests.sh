#!/bin/bash


tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo dispenser_requests' ENTER;
tmux split-window  -v
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo door_requests' ENTER;
tmux split-window -v 
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo lift_requests' ENTER;
tmux split-window -v 
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo robot_path_requests' ENTER;
tmux select-layout even-horizontal
