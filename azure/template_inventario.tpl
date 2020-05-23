[host_terraform]
%{ for ip in vm_terraform ~}
${ip} ansible_user=adminuser ansible_ssh_private_key_file=~/.ssh/id_rsa ami_user=adminuser
%{ endfor ~}
