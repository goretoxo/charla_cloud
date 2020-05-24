
provider "aws" {
  region 			= var.aws_region
  shared_credentials_file 	= "~/.aws/credentials"
}

provider "azurerm" {
  version = "=2.0.0"
  features {}
}

