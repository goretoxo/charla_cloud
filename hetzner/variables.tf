variable "hcloud_token" {}

variable "numero_de_instancias" {
  default = 3
}

# tipos de maquinas
# cx11 - 1cpu, 2Gbram - 2.96€/mes
# cx21 - 2cpu, 4Gram  - 6€/mes
variable "server_type" {
  default = "cx21"
}

# imagenes de maquina
# debian-9
# centos-7
variable "imagen" {
  default = "centos-7"
}

variable "ami_user" {
  default = "root"
}

variable "sshkey" {
  default = "llave1"
}
