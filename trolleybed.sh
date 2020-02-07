#!/bin/bash


tmux send 'ssh trolleybed' ENTER;
tmux split-window  -v
tmux send 'ssh trolleybed' ENTER;
tmux split-window  -v
tmux send 'ssh trolleybed' ENTER;
tmux split-window  -v
tmux send 'ssh trolleybed' ENTER;
tmux select-layout even-vertical
