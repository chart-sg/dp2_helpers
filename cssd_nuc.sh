#!/bin/bash


tmux send 'ssh cssd_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh cssd_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh cssd_nuc' ENTER;
tmux select-layout even-vertical
