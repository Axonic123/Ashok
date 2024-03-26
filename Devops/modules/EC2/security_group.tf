resource "aws_security_group" "ec2_security_group" {
  name   = var.ec2_security_group_name
  vpc_id = var.vpc_id 

  tags = {
    Name = var.security_group_name
  }
}


resource "aws_security_group_rule" "ec2_ingress_rules" {
  count = length(var.ec2_ingress_rules)

  security_group_id = aws_security_group.ec2_security_group.id
  type              = "ingress"

  cidr_blocks = var.ec2_ingress_cidr_blocks
  from_port   = var.ec2_ingress_rules_from_port[count.index]
  to_port     = var.ec2_ingress_rules_to_port[count.index]
  protocol    = var.ec2_ingress_rules_protocols[count.index]
}

resource "aws_security_group_rule" "ec2_egress_rules" {
  count = length(var.ec2_egress_rules)

  security_group_id = aws_security_group.ec2_security_group.id
  type              = "egress"

  cidr_blocks = var.ec2_egress_cidr_blocks
  from_port   = var.ec2_egress_rules_from_port[count.index]
  to_port     = var.ec2_egress_rules_to_port[count.index]
  protocol    = var.ec2_egress_rules_protocols[count.index]
}
