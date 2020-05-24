resource "azurerm_resource_group" "rg_terraform" {
  name     = var.az_rg
  location = var.az_location
}

resource "azurerm_virtual_network" "net_terraform" {
  name                = var.az_net
  address_space       = var.az_net_cidr
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
}

resource "azurerm_subnet" "subnet_terraform" {
  name                 = var.az_subnet
  resource_group_name  = azurerm_resource_group.rg_terraform.name
  virtual_network_name = azurerm_virtual_network.net_terraform.name
  address_prefix       = var.az_subnet_cidr
}

resource "azurerm_public_ip" "public_ip_terraform" {
  count		      = var.numero_de_instancias
  name                = "az_terraform_public_ip-${count.index}"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic_terraform" {
  count		      = var.numero_de_instancias
  name                = "az_terraform-nic_${count.index}"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_terraform.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id	  = azurerm_public_ip.public_ip_terraform[count.index].id
  }
}

resource "azurerm_network_security_group" "sg_terraform" {
  name                = "az_terraform-nsg"
  location            = azurerm_resource_group.rg_terraform.location
  resource_group_name = azurerm_resource_group.rg_terraform.name

  security_rule {
    name                       = "allow_de_todo"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range	       = "*"
    destination_port_range     = "*"
    source_address_prefix      = var.homeip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "asoc_terraform" {
  count 		    = var.numero_de_instancias
  network_interface_id      = azurerm_network_interface.nic_terraform[count.index].id
  network_security_group_id = azurerm_network_security_group.sg_terraform.id
}


resource "azurerm_linux_virtual_machine" "vm_terraform" {
  count 	      = var.numero_de_instancias
  name                = "az-terraform-vm-${count.index}"
  resource_group_name = azurerm_resource_group.rg_terraform.name
  location            = azurerm_resource_group.rg_terraform.location
  size                = var.az_vm_size
  admin_username      = var.az_vm_user
  network_interface_ids = [
    azurerm_network_interface.nic_terraform[count.index].id,
  ]

  admin_ssh_key {
    username   = var.az_vm_user
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.az_image_pub
    offer     = var.az_image_ofr
    sku       = var.az_image_sku
    version   = var.az_image_ver
  }
  plan {
    name 	= var.az_image_ofr
    product 	= var.az_image_sku
    publisher 	= var.az_image_pub
  }
}




# generate inventory file for Ansible
resource "local_file" "inventario" {
  content = templatefile("azure/template_inventario.tpl",
    {
      vm_terraform = azurerm_public_ip.public_ip_terraform.*.ip_address
      ami_user          = var.az_vm_user
    }
  )
  filename = "azure/inventario"
}

# generate ssh script
resource "local_file" "ssh_logon" {
  content = templatefile("azure/template_ssh.tpl",
    {
      vm_terraform = azurerm_public_ip.public_ip_terraform.*.ip_address
      ami_user          = var.az_vm_user
    }
  )
  filename = "azure/ssh.sh"
}
