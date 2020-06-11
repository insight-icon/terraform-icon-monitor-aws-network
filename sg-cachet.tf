
resource "aws_security_group" "cachet" {
  count  = 1
  vpc_id = module.vpc.vpc_id

  name = "cachet-${var.name}"
  tags = var.tags
}

resource "aws_security_group_rule" "cachet_ssh" {
  count             = 1
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.cachet.*.id)
  cidr_blocks       = ["0.0.0.0/0"]

  type = "ingress"
}

resource "aws_security_group_rule" "http" {
  count             = 1
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.cachet.*.id)
  cidr_blocks       = ["0.0.0.0/0"]

  type = "ingress"
}

resource "aws_security_group_rule" "cachet_https" {
  count             = 1
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.cachet.*.id)
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}

resource "aws_security_group_rule" "cachet_egress" {
  count             = 1
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.cachet.*.id)
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
}
