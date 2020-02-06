#!/bin/bash


tmux send 'ssh magni1' ENTER;
tmux split-window  -v
tmux send 'ssh magni2' ENTER;
tmux select-layout even-vertical
