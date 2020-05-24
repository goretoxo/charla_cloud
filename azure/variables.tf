#######
# variables que es mas probable que cambies
#######

variable "numero_de_instancias" {
  default = 1
}

variable "az_location" {
  default = "West Europe"
}

# 1 vcpu; 1Gb - Standard_B1s
# 2 vcpu; 4Gb - Standard_B2s
# 2 vcpu; 4Gb - Standard_F2
variable "az_vm_size" {
  default = "Standard_F2"
}

# PARAMETROS QUE DEPENDEN DE LA AMI USADA, para eu-west-1
variable "az_image_pub" {
  default = "northbridge-secure"
#  default = "Canonical"
}

variable "az_image_ofr" {
  default = "centos7"
#  default = "UbuntuServer"
}

variable "az_image_sku" {
  default = "centos7"
#  default = "16.04-LTS"
}

variable "az_image_ver" {
  default = "00.7.4"
#  default = "latest"
}

variable "homeip" {
  default ="0.0.0.0/32"
}


#######
# variables que no hace falta cambiar
#######
variable "az_vm_user" {
  default = "adminuser"
}

variable "az_tag_name" {
  default = "pruebas_terraform"
}

variable "az_rg" {
  default = "pruebas_terraform"
}

variable "az_net" {
  default = "terraform_network"
}

variable "az_net_cidr" {
  default = ["192.168.0.0/16"]
}

variable "az_subnet" {
  default = "subnet_terraform"
}

variable "az_subnet_cidr" {
  default = "192.168.2.0/24"
}

