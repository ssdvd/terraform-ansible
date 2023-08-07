module "aws-prod" {
  source = "../../infra"
  instancia = "t2.micro"
  regiao_aws = "us-east-2"
  chave = "iac-prod"
}

output "IP" {
  value = module.aws-dev.IP_publico
}