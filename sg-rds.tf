resource "aws_security_group" "rds" {
  vpc_id = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = [
      5432, # pg
    ]

    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      security_groups = [aws_security_group.cachet.id]
    }
  }

  //  TODO -> RM
  ingress {
    from_port   = 5432
    protocol    = "tcp"
    to_port     = 5432
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "pg" {
  count             = 1
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.rds.*.id)
  type              = "ingress"
}

resource "aws_security_group_rule" "egress" {
  count             = 1
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = join("", aws_security_group.cachet.*.id)
  type              = "egress"
}
