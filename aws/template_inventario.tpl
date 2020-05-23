[host_terraform]
%{ for ip in vm_terraform ~}
${ip} ansible_user=ec2-user ansible_ssh_private_key_file=key_test20190227 ami_user=ec2-user
%{ endfor ~}
