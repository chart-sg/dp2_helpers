#!/bin/bash

cd ~/dev/dp2_ws && source /opt/ros/eloquent/setup.bash && colcon build
#ssh -t ubuntu@magni1.local "cd magni_ws && source /opt/ros/melodic/setup.bash && catkin build"
ssh -t ubuntu@magni2.local "cd magni_ws && source /opt/ros/melodic/setup.bash && catkin build"
ssh -t ubuntu@magni3.local "cd magni_ws && source /opt/ros/melodic/setup.bash && catkin build"
#ssh -t ubuntu@magni4.local "cd magni_ws && source /opt/ros/melodic/setup.bash && catkin build"
