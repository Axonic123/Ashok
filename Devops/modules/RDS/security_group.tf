resource "aws_security_group" "rds_security_group" {
  name   = var.rds_security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = var.rds_security_group_tag_name
  }
}

#############################
# Ingress rule
#############################

#ingress rule for ipv4 "0.0.0.0/0" CIDR
resource "aws_security_group_rule" "rds_ingress_rules" {
  count = var.enable_ingress_ipv4 ? length(var.rds_ingress_rules_ipv4) : 0

  security_group_id = aws_security_group.rds_security_group.id
  type              = "ingress"

  cidr_blocks = var.rds_ingress_cidr_blocks_ipv4
  from_port   = var.rds_ingress_rules_from_port_ipv4[count.index]
  to_port     = var.rds_ingress_rules_to_port_ipv4[count.index]
  protocol    = var.rds_ingress_rules_protocols_ipv4[count.index]
}

#ingress rule for ipv6 "::/0" CIDR

resource "aws_security_group_rule" "rds_ingress_rules_ipv6" {
  count = var.enable_ingress_ipv6 ? length(var.rds_ingress_rules_ipv6) : 0
  type              = "ingress"
  security_group_id = aws_security_group.rds_security_group.id
  ipv6_cidr_blocks = var.rds_ingress_cidr_blocks_ipv6
  from_port   = var.rds_ingress_rules_from_port_ipv6[count.index]
  to_port     = var.rds_ingress_rules_to_port_ipv6[count.index]
  protocol    = var.rds_ingress_rules_protocols_ipv6[count.index]
}

#ingress rule for source_security_group_id

resource "aws_security_group_rule" "rds_ingress_rules_self" {
  count = var.enable_ingress_self ? length(var.rds_ingress_rules_self) : 0
  type              = "ingress"
  security_group_id = aws_security_group.rds_security_group.id
  source_security_group_id = aws_security_group.rds_security_group.id
  from_port   = var.rds_ingress_rules_from_port_self[count.index]
  to_port     = var.rds_ingress_rules_to_port_self[count.index]
  protocol    = var.rds_ingress_rules_protocols_self[count.index]
}

#############################
# Egress rule
#############################
#egress rule for ipv4 "0.0.0.0/0" CIDR

resource "aws_security_group_rule" "rds_egress_rules" {
  count = var.enable_egress_self ? length(var.rds_egress_rules_ipv4) : 0
  security_group_id = aws_security_group.rds_security_group.id
  type              = "egress"
  cidr_blocks = var.rds_egress_cidr_blocks_ipv4
  from_port   = var.rds_egress_rules_from_port_ipv4[count.index]
  to_port     = var.rds_egress_rules_to_port_ipv4[count.index]
  protocol    = var.rds_egress_rules_protocols_ipv4[count.index]
}

#egress rule for ipv6 "::/0" CIDR

resource "aws_security_group_rule" "rds_egress_rules_ipv6" {
  count = var.enable_egress_ipv6 ? length(var.rds_egress_rules_ipv6) : 0
  type              = "egress"
  security_group_id = aws_security_group.rds_security_group.id
  ipv6_cidr_blocks = var.rds_egress_cidr_blocks_ipv6
  from_port   = var.rds_egress_rules_from_port_ipv6[count.index]
  to_port     = var.rds_egress_rules_to_port_ipv6[count.index]
  protocol    = var.rds_egress_rules_protocols_ipv6[count.index]
}

#egress rule for source_security_group_id

resource "aws_security_group_rule" "rds_egress_rules_self" {
  count = var.enable_egress_self ? length(var.rds_egress_rules_self) : 0
  type              = "egress"
  security_group_id = aws_security_group.rds_security_group.id
  source_security_group_id = aws_security_group.rds_security_group.id
  from_port   = var.rds_egress_rules_from_port_self[count.index]
  to_port     = var.rds_egress_rules_to_port_self[count.index]
  protocol    = var.rds_egress_rules_protocols_self[count.index]
}
