variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_vpc_id" {
  default ="vpc-64dd2c0f"
}

variable "home_ip" {
  default ="47.61.240.105/32"
}

variable "numero_de_instancias" {
  default = 2
}

# PARAMETROS QUE DEPENDEN DE LA AMI USADA, para eu-west-1
# LINUX AMI2
#aws_image: "ami-0838da7c1467f590c"
#ami_user: "ec2-user"
# CentOS 7 oficial
#aws_image: "ami-0ff760d16d9497662"
#ami_user: "centos"
# ubuntu 18.04
#aws_image: "ami-08d658f84a6d84a80"
#ami_user: "ubuntu"
# RHEL 7.4
#aws_image: "ami-0e12cbde3e77cbb98"
#ami_user: ec2-user
# RHEL no funciona en maquinas mas pequenhas que t2.micro
#aws_instance_type: "t2.micro"
# RHEL 7.6
#aws_image: "ami-0202869bdd0fc8c75"
#ami_user: ec2-user
# RHEL no funciona en maquinas mas pequenhas que t2.micro
variable "aws_image" {
  default ="ami-0838da7c1467f590c"
}

# 1 vcpu; 0,5Gb - t2.nano
# 2 vcpu; 05Gb  - t3.nano
# 2 vcpu; 4Gb   - t3.medium
variable "aws_instance_type" {
  default ="t3.medium"
}

variable "aws_key_name" {
  default ="test20190227"
}

variable "aws_tag_name" {
  default = "pruebas_terraform"
}

