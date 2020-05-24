[host_terraform]
%{ for ip in vm_terraform ~}
${ip} ansible_user=${ami_user} ansible_ssh_private_key_file=aws/key_test20190227 ami_user=${ami_user}
%{ endfor ~}
