# Selecionando o provedor cloud
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

# Configurando o provedor
provider "aws" {
    profile = "default"
    region  = var.regiao_aws
}

# Selecionando os recursos
resource "aws_instance" "app_server" {
    ami             = "ami-0261755bbcb8c4a84"
    instance_type   = var.instancia
    key_name = var.chave
    tags = {
        name = "Terraform Ansible Python"
    }
}

resource "aws_key_pair" "ChaveSSH"{
    key_name = var.chave
    public_key = file("${var.chave}.pub")
}
