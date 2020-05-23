variable "az_tag_name" {
  default = "pruebas_terraform"
}

variable "az_rg" {
  default = "pruebas_terraform"
}

variable "az_location" {
  default = "West Europe"
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

variable "numero_de_instancias" {
  default = 2
}

# 1 vcpu; 1Gb - Standard_B1s
# 2 vcpu; 4Gb - Standard_B2s
# 2 vcpu; 4Gb - Standard_F2
variable "az_vm_size" {
  default = "Standard_F2"
}

variable "az_vm_user" {
  default = "adminuser"
}

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

