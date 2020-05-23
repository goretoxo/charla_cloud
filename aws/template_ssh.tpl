#!/bin/bash
tmux new-session -d

%{ for ip in vm_terraform ~}
tmux split-window -h 'ssh ec2-user@${ip} -i key_test20190227'
%{ endfor ~}

tmux select-layout even-horizontal
tmux attach

