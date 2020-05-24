#
# recursos en AWS

resource "aws_vpc" "vpc_terraform" {
  cidr_block = var.aws_net_cidr
}

resource "aws_subnet" "subnet_terraform" {
  vpc_id     			= aws_vpc.vpc_terraform.id
  cidr_block 			= var.aws_subnet_cidr
  map_public_ip_on_launch 	= true
}

resource "aws_internet_gateway" "igw_terraform" {
  vpc_id = aws_vpc.vpc_terraform.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_terraform.id
  }
}

resource "aws_main_route_table_association" "rta" {
  vpc_id         = aws_vpc.vpc_terraform.id
  route_table_id = aws_route_table.rt.id
}


resource "aws_security_group" "sg_terraform" {
  name        = "sg_terraform"
  description = "grupo de seguridad para entrada por ssh"
  vpc_id      = aws_vpc.vpc_terraform.id
  ingress {
    description = "ssh from home"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [ var.homeip ]
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg_terraform"
  }
}

resource "aws_instance" "vm_terraform"  {
  vpc_security_group_ids = [ aws_security_group.sg_terraform.id ]
  subnet_id		 = aws_subnet.subnet_terraform.id
  count                  = var.numero_de_instancias
  ami                    = var.aws_image
  instance_type          = var.aws_instance_type
  key_name               = var.aws_key_name
  depends_on = [ aws_internet_gateway.igw_terraform ]
  tags = {
    Name = "vm_terraform ${count.index}"
  }
}


#
# recursos en local

# generate inventory file for Ansible
resource "local_file" "inventario" {
  content = templatefile("aws/template_inventario.tpl",
    {
      vm_terraform 	= aws_instance.vm_terraform.*.public_ip
      ami_user 		= var.ami_user
    }
  )
  filename = "aws/inventario"
}
# generate ssh script
resource "local_file" "ssh_script" {
  content = templatefile("aws/template_ssh.tpl",
    {
      vm_terraform = aws_instance.vm_terraform.*.public_ip
      ami_user 		= var.ami_user
    }
  )
  filename = "aws/ssh.sh"
}
