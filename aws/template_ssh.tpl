#!/bin/bash
tmux new-session -d

%{ for ip in vm_terraform ~}
tmux split-window -h 'ssh ${ami_user}@${ip} -i aws/key_test20190227'
%{ endfor ~}

tmux select-layout even-horizontal
tmux attach

