#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "destruye.sh [aws|azure]"
    exit
fi

if [ "$1" == "azure" ]
  then
    source /home/pedro/trabajo/llaves/azure/credentials
    echo "${ARM_TENANT_ID}"
fi


terraform destroy -state=$1/estado.tfstate $1

