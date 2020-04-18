output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "rds_security_group_id" {
  value = join("", aws_security_group.rds.*.id)
}

output "cachet_security_group_id" {
  value = join("", aws_security_group.cachet.*.id)
}
