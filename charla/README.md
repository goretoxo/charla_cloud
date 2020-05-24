TO-DO:
x - git repo
x - seguir con las pruebas
## cloud facil pa ti

# cloud es un ordenador de otra persona
thereisnocloud.jpg



# [M|I|P|F|S|...]aaS
 - un grafico con los niveles de abstraccion de cada letra, y ejemplos
XaaS.png


SaaS 
gmail
office 365
wordpress.org
...


# FaaS
lambda
https://www.openfaas.com/
- solo esta funcionando mientras se ejecuta, pago por tiempo
- funciones y dependencias




# PaaS
- heroku
- pythonanywhere
- openshift

- arquitecturas complejas, 


# IaaS


- cosas que se llaman igual, o no
 - servicios y recursos equiparables en AWS, Azure y OpenStack/Rackspace
https://www.cloudhealthtech.com/blog/cloud-comparison-guide-glossary-aws-azure-gcp


- uso como laboratorio/ uso como produccion

- despliegue y configuracion, 
 - herramientas para cada paso
(ejemplo de terraform para despliegue y ansible para configuracion)
https://medium.com/faun/building-repeatable-infrastructure-with-terraform-and-ansible-on-aws-3f082cd398ad
instalar terraform:
https://www.terraform.io/downloads.html
```
terraform init
terraform plan -out=plan.zip
terraform apply plan.zip
terraform show
ansible-playbook -i inventario.txt crea.yml
---
terraform destroy
```

 - ansible como herramienta universal
(mis ejemplos de despliegue)

 -ansible Y terraform

   - autenticando en azure y aws con terraform
	https://geekdudes.files.wordpress.com/2018/01/get_secret1.png?w=614
https://geekdudes.wordpress.com/2018/01/22/configuring-terraform-for-azure/
https://www.terraform.io/docs/providers/azurerm/index.html
```
    source /home/pedro/trabajo/llaves/azure/credentials
    cat /home/pedro/.aws/credentials
```


documentacion de terraform para crear maquina
https://www.terraform.io/docs/providers/azurerm/r/linux_virtual_machine.html



- el proceso de alta en azure y en aws
 - verificacion por tarjeta

- cloud frente a VPS frente a Hetzner
 - costes y objetivos

 - el caso de foro.hacklabalmeria
https://www.hetzner.com/sb
 - mix & mix

- decisiones sobre dependencia: 
  - kubernetes o el servicio de kubernetes de aws/azure/google?
  - en que lugar del stack queremos vivir?

