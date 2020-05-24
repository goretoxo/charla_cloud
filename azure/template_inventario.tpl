[host_terraform]
%{ for ip in vm_terraform ~}
${ip} ansible_user=${ami_user} ansible_ssh_private_key_file=~/.ssh/id_rsa ami_user=${ami_user}
%{ endfor ~}
