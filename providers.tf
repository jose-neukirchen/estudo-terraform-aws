terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" #Região a ser trabalhada
}

#Configurando segundo provedor
provider "aws" {
  alias = "us-east-2"
  region = "us-east-2" #Região a ser trabalhada
}