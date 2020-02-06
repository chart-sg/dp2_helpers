#!/bin/bash


tmux send 'launch_mir_driver' ENTER;
tmux split-window -h
tmux send 'launch_magni_driver' ENTER;
tmux split-window -h
tmux send 'launch_core' ENTER;
