#!/bin/bash

tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo dispenser_states' ENTER;
tmux split-window  -v
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo door_states' ENTER;
tmux split-window -v 
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo lift_states' ENTER;
tmux split-window -v 
tmux send 'source /opt/ros/eloquent/setup.bash && source ~/dp2_ws/ros2/install/setup.bash && ros2 topic echo fleet_states' ENTER;
tmux select-layout even-horizontal
