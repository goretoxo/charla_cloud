[host_terraform]
%{ for ip in vm_terraform ~}
${ip}
%{ endfor ~}

