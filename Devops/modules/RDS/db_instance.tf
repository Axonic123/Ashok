resource "aws_db_instance" "rds_db_instance" {
  identifier                 = var.db_instance_identifier
  allocated_storage          = var.allocated_storage
  max_allocated_storage      = var.max_allocated_storage 
  storage_type               = var.storage_type
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  username                   = var.db_username
  password                   = var.db_password
  storage_encrypted          = var.storage_encrypted
  vpc_security_group_ids     = [aws_security_group.rds_security_group.id]
  db_subnet_group_name       = aws_db_subnet_group.db_subnet_group.name
  deletion_protection        = var.deletion_protection 

  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  apply_immediately          = var.apply_immediately
  skip_final_snapshot        = var.skip_final_snapshot
  final_snapshot_identifier  = var.final_snapshot_identifier
  copy_tags_to_snapshot      = var.copy_tags_to_snapshot
  publicly_accessible        = var.publicly_accessible
  parameter_group_name       = aws_db_parameter_group.rds_parameter_group.name

  # Enable enhanced monitoring
  monitoring_interval         = var.monitoring_interval # Interval in seconds (minimum 60 seconds)
  monitoring_role_arn         = aws_iam_role.rds_monitoring_role.arn

  # Enable performance insights
  performance_insights_enabled = var.performance_insights_enabled
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  allow_major_version_upgrade   = var.allow_major_version_upgrade
  
  tags = tomap({
    "Name" = "${var.db_instance_identifier}",
    "Project"   = "${var.project}",
    "Env"       = "${var.environment}",
    "Terraform" = "true"
  })
}
