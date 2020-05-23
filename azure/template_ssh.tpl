#!/bin/bash
tmux new-session -d

%{ for ip in vm_terraform ~}
tmux split-window -h 'ssh adminuser@${ip}'
%{ endfor ~}

tmux select-layout even-horizontal
tmux attach

