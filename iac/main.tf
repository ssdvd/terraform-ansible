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
    region  = "us-east-1"
}

# Selecionando os recursos
resource "aws_instance" "app_server" {
    ami             = "ami-0261755bbcb8c4a84"
    instance_type   = "t2.micro"
    #definindo o par de chave
    key_name = "IaC-ssdvd"
    #Criando um arquivo para visualizacao web e servico nohup busybox
    /* user_data = <<-EOF
                   #!/bin/bash
                   cd /home/ubuntu
                   echo "<h1>Feito com o Terraform</h1>" > index.html
                   nohup busybox httpd -f -p 8080 &
                   EOF */
    tags = {
        name = "Terraform Ansible Python"
    }
}