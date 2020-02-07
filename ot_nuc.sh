#!/bin/bash


tmux send 'ssh ot_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh ot_nuc' ENTER;
tmux split-window  -v
tmux send 'ssh ot_nuc' ENTER;
tmux select-layout even-vertical
