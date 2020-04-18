module "label" {
  source = "github.com/robc-io/terraform-null-label.git?ref=0.16.1"

  name = var.name

  tags = {
    Terraform = true
    VpcType   = var.vpc_type
  }

  environment = var.environment
  namespace   = var.namespace
}

data "aws_availability_zones" "this" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = module.label.id
  cidr = "10.0.0.0/16"

  azs             = [for r in data.aws_availability_zones.this.names : r]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = module.label.tags
}

