#!/bin/bash

tmux send 'ssh cssd_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh cssd_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh cssd_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh trolleybed' ENTER;
tmux split-window  -v
tmux select-layout even-vertical

tmux send 'launch_mir_driver' ENTER;
tmux split-window -h
tmux send 'launch_magni_driver' ENTER;
tmux split-window -h
tmux send 'launch_core' ENTER;
