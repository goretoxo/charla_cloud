#!/bin/bash

terraform plan
terraform apply

ansible-playbook -i inventario crea.yml
