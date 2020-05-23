#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "crea.sh [aws|azure]"
    exit
fi

if [ "${1: -1}" == "/" ]
  then
    echo "crea.sh [aws|azure]"
    exit
fi
  

if [ "$1" == "azure" ]
  then
    source /home/pedro/trabajo/llaves/azure/credentials
fi

terraform plan -state=$1/estado.tfstate $1

terraform apply -state=$1/estado.tfstate $1


sleep 20

ansible-playbook -i $1/inventario crea.yml
