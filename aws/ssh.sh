#!/bin/bash
tmux new-session -d

tmux split-window -h 'ssh ec2-user@54.216.168.95 -i key_test20190227'
tmux split-window -h 'ssh ec2-user@34.244.109.123 -i key_test20190227'

tmux select-layout even-horizontal
tmux attach

