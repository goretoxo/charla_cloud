#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "crea.sh [aws|azure]"
    exit
fi

if [ "$1" == "azure" ]
  then
    source /home/pedro/trabajo/llaves/azure/credentials
fi

terraform plan $1

terraform apply $1


sleep 20

ansible-playbook -i inventario crea.yml
