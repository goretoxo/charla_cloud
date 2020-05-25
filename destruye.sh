#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "destruye.sh [aws|azure|hetzner]"
    exit
fi

if [ "${1: -1}" == "/" ]
  then
    echo "crea.sh [aws|azure|hetzner]"
    exit
fi



if [ "$1" == "azure" ]
  then
    source /home/pedro/trabajo/llaves/azure/credentials
    echo "${ARM_TENANT_ID}"
fi

if [ "$1" == "hetzner" ]
  then
    source ~/trabajo/llaves/credentials_hetzner
fi


terraform destroy -state=$1/estado.tfstate $1

