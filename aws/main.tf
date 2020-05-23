resource "aws_security_group" "sg_terraform" {
  name        = "sg_terraform"
  description = "grupo de seguridad para entrada por ssh"
  vpc_id      = var.aws_vpc_id
  ingress {
    description = "ssh from home"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [ var.home_ip ]
    protocol    = "tcp"
  }
  tags = {
    Name = "sg_terraform"
  }
}

resource "aws_instance" "vm_terraform"  {
  vpc_security_group_ids = [ aws_security_group.sg_terraform.id ]
  count                  = var.numero_de_instancias
  ami                    = var.aws_image
  instance_type          = var.aws_instance_type
  key_name               = var.aws_key_name
  tags = {
    Name = "probando cosas de terraform"
  }
}

# generate inventory file for Ansible
resource "local_file" "inventario" {
  content = templatefile("aws/template_inventario.tpl",
    {
      vm_terraform = aws_instance.vm_terraform.*.public_ip
    }
  )
  filename = "aws/inventario"
}
# generate ssh script
resource "local_file" "ssh_script" {
  content = templatefile("aws/template_ssh.tpl",
    {
      vm_terraform = aws_instance.vm_terraform.*.public_ip
    }
  )
  filename = "aws/ssh.sh"
}
