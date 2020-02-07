#!/bin/bash


tmux send "ssh trolleybed './start_bolt_on_kit.sh'" ENTER;
tmux split-window  -v
tmux send "ssh trolleybed './start_map_server.sh'" ENTER;
tmux split-window  -v
tmux send "ssh trolleybed './start_trolley_bed.sh'" ENTER;
tmux split-window  -v
tmux send "ssh trolleybed 'export ROS_DOMAIN_ID=77 ; . /opt/ros/dashing/setup.bash; . /home/ubuntu/ros2_ws/install/setup.bash; ros2 run smart_trolley_bed smart_trolley_bed Bed001 Hope BedFleetA __ns:=/BedFleetA/Bed001;'" ENTER;
tmux split-window  -v
tmux send 'ssh trolleybed' ENTER;
tmux select-layout even-vertical
