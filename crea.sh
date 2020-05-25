#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "crea.sh [aws|azure|hetzner]"
    exit
fi

if [ "${1: -1}" == "/" ]
  then
    echo "crea.sh [aws|azure|hetzner]"
    exit
fi
  
if [ "$1" == "azure" ]
  then
    source ~/trabajo/llaves/azure/credentials
fi

if [ "$1" == "hetzner" ]
  then
    source ~/trabajo/llaves/credentials_hetzner
fi

# el valor de la ip local, para autorizar desde los grupos de seguridad
export TF_VAR_homeip="$(curl -s ifconfig.io)/32"

# lanzamos el terraform PLAN
terraform plan -state=$1/estado.tfstate $1

# lanzamos el terraform APPLY
terraform apply -state=$1/estado.tfstate $1

sleep 20

# personalizamos las maquinas
ansible-playbook -i $1/inventario configura.yml

# conectamos con las maquinas
./$1/ssh.sh
