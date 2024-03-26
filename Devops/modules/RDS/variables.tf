variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type = list(string)
}

variable "environment" {
  type        = string
  description = "The environment in which the resources will be deployed (e.g., 'production', 'development', 'staging')."
}

variable "project" {
  type        = string
  description = "The name of the project or application associated with these resources."
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "rds_security_group_name" {
  description = "Name of security group for RDS."
  type        = string
}

variable "rds_security_group_tag_name" {
  description = "Tag of security group for RDS."
  type        = string
}

#ingress rule variables for ipv4 "0.0.0.0/0" CIDR

variable "enable_ingress_ipv4" {
  default     = false 
  type        = bool
}

variable "rds_ingress_rules_ipv4" {
  description = "Ingress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_ingress_cidr_blocks_ipv4" {
  description = "Ingress CIDR Blocks of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_ingress_rules_from_port_ipv4" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_to_port_ipv4" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_protocols_ipv4" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

#ingress rule variables for ipv6 "::/0" CIDR

variable "enable_ingress_ipv6" {
  default     = false
  type        = bool
}

variable "rds_ingress_rules_ipv6" {
  description = "Ingress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_ingress_cidr_blocks_ipv6" {
  description = "Ingress CIDR Blocks of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_ingress_rules_from_port_ipv6" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_to_port_ipv6" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_protocols_ipv6" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

# ingress rule variables for source_security_group_id
variable "enable_ingress_self" {
  default = false
  type        = bool
}

variable "rds_ingress_rules_self" {
  description = "Ingress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_ingress_rules_from_port_self" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_to_port_self" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_ingress_rules_protocols_self" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

#egress rule variables for ipv4 "0.0.0.0/0" CIDR

variable "enable_egress_ipv4"{
  type = bool
  default = false
}

variable "rds_egress_rules_ipv4" {
  description = "Egress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_cidr_blocks_ipv4" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_rules_from_port_ipv4" {
  description = "Egress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_to_port_ipv4" {
  description = "Egress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_protocols_ipv4" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

#egress rule variables for ipv6 "::/0" CIDR

variable "enable_egress_ipv6" {
  default = false
  type = bool
}
variable "rds_egress_rules_ipv6" {
  description = "Egress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_cidr_blocks_ipv6" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_rules_from_port_ipv6" {
  description = "Egress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_to_port_ipv6" {
  description = "Egress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_protocols_ipv6" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

#egress rule for source_security_group_id

variable "enable_egress_self" {
  default = false
  type = bool
}
variable "rds_egress_rules_self" {
  description = "Egress rules of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_cidr_blocks_self" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "rds_egress_rules_from_port_self" {
  description = "Egress rules from port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_to_port_self" {
  description = "Egress rules to port of security group for RDS."
  type        = list(number)
  default     = [ ]
}

variable "rds_egress_rules_protocols_self" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(string)
  default     = [ ]
}

variable "ingress_rule_database_port" {
  description = "Ingress rule port for RDS cluster."
  type        = number
}

variable "ingress_rule_port_protocol" {
  description = "Ingress rule protocol for RDS cluster."
  type        = string
}

variable "db_instance_identifier" {
  type        = string
  description = "A unique identifier for the DB instance"
}

variable "allocated_storage" {
  type        = number
  description = "The amount of storage in gibibytes to allocate to the DB instance"
}

variable "storage_type" {
  type        = string
  description = "The storage type for the DB instance. Example values: 'gp2', 'io1', 'standard'"
}

variable "engine" {
  type        = string
  description = "The name of the database engine to be used for the DB instance"
}

variable "engine_version" {
  type        = string
  description = "The version number of the database engine to be used"
}

variable "instance_class" {
  type        = string
  description = "The compute and memory capacity of the DB instance"
}

variable "db_username" {
  type        = string
  description = "The master username for the DB instance"
}

variable "db_password" {
  type        = string
  description = "The master password for the DB instance"
}

variable "backup_retention_period" {
  type        = number
  description = "The number of days to retain automatic backups"
}

variable "maintenance_window" {
  type        = string
  description = "The window during which maintenance can occur on the DB instance"
}

variable "backup_window" {
  type        = string
  description = "The daily time range during which automated backups are created"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before deleting the DB instance"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name to use for the final DB snapshot when skip_final_snapshot is true"
}

variable "monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected"
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Specifies whether Performance Insights is enabled or not"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group for the RDS instance"
}

variable "db_subnet_group_tag_name" {
  type        = string
  description = "Name tag for the DB subnet group"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "A list of log types to export to CloudWatch Logs."
}

variable "deletion_protection" {
  type        = bool
  description = "Whether to enable deletion protection for the RDS instance."
}

variable "allow_major_version_upgrade" {
  type        = bool
  description = "Whether major version upgrades are allowed for the RDS instance."
}

variable "apply_immediately" {
  type        = bool
  description = "Whether to apply changes immediately or wait for the next maintenance window."
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Whether to copy tags from the RDS instance to its snapshots."
}

variable "publicly_accessible" {
  type        = bool
  description = "Whether the RDS instance should have a publicly accessible IP address."
}

variable "storage_encrypted" {
  type = bool
  description = "Whether encryption is enabled or not"
}

variable "max_allocated_storage" {
  type = number
  description = "The max amount of storage in gibibytes to allocate to the DB instance"
}

variable "parameter_group_name" {
  type = string
  description = "The name of the parameter group in which to modify the parameter."
}

variable "parameter_group_family" {
  type = string
  description = "The family of the parameter group in which to modify the parameter."
}

variable "parameter_name" {
  type = string
  description = "The name of the parameter to modify."
}

variable "parameter_value" {
  type = string
  description = "The new value for the parameter."
}

variable "parameter_apply_method" {
  type = string
  description = "Determines whether the parameter change is applied immediately or during the next maintenance window. Set to true to apply immediately, false otherwise."
}
