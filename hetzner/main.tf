resource "hcloud_server" "vm" {
  count               	= var.numero_de_instancias
  name 			= "vm-${count.index}"
  image 		= var.imagen
  server_type 		= var.server_type
  ssh_keys 		= [ var.sshkey ]
}





# generate inventory file for Ansible
resource "local_file" "inventario" {
  content = templatefile("hetzner/template_inventario.tpl",
    {
      vm_terraform = hcloud_server.vm.*.ipv4_address
      ami_user          = var.ami_user
    }
  )
  filename = "hetzner/inventario"
}

# generate ssh script
resource "local_file" "ssh_logon" {
  content = templatefile("hetzner/template_ssh.tpl",
    {
      vm_terraform = hcloud_server.vm.*.ipv4_address
      ami_user          = var.ami_user
    }
  )
  filename = "hetzner/ssh.sh"
}


