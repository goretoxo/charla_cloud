variable "az_tag_name" {
  default = "pruebas_terraform"
}

provider "azurerm" {
  version = "=2.0.0"
  features {}
}
