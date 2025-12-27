module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = var.vpc_cidr
  public_subnets_cidr     = var.public_subnets_cidr
  aws_region              = var.aws_region
  project_name            = var.project_name
  tags                    = var.tags
}
