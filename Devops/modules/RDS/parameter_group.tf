resource "aws_db_parameter_group" "rds_parameter_group" {
  name   = var.parameter_group_name
  family = var.parameter_group_family

  parameter {
    name  = var.parameter_name
    value = var.parameter_value
    apply_method = var.parameter_apply_method
  }

  lifecycle {
    create_before_destroy = true
  }
}
