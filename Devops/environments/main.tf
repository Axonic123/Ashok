module "vpc" {
  source                   = "../modules/vpc"

  vpc_cidr                 = "10.0.0.0/16"
  vpc_name                 = "vpc-us-east1"
  subnets = [
    {
      name                 = "subnet-1",
      cidr                 = "10.0.0.0/20",
      availability_zones   = "us-east-1a"
    },
    {
      name                 = "subnet-2",
      cidr                 = "10.0.16.0/20",
      availability_zones   = "us-east-1b"
    }
    # Add more subnets as needed
  ]
  internet_gateway_name    = "igw-east1"
  public_route_table_name  = "route-table-east1"
}

module "rds" {
  source                                                 = "../modules/rds"

  vpc_id                                                 = module.vpc.vpc_id
  subnet_ids                                             = module.vpc.subnets_id
  environment                                            = "STAGE"
  project                                                = "devops-fullstack-app"

  # security group variables

  rds_security_group_name                                = "devops-rds-db"
  rds_security_group_tag_name                            = "rds-sg"

  # Ingress rule variable
  enable_ingress_ipv4                                    = true
  rds_ingress_rules_ipv4                                 = [5432, 3000, 8080]
  rds_ingress_cidr_blocks_ipv4                           = ["0.0.0.0/0"]
  rds_ingress_rules_from_port_ipv4                       =  [5432, 3000, 8080]
  rds_ingress_rules_to_port_ipv4                         =  [5432, 3000, 8080]
  rds_ingress_rules_protocols_ipv4                       = ["tcp","tcp", "tcp"]

# Egress rule variable

  #egress rule for "0.0.0.0/0" CIDR
  enable_egress_ipv4                                     = true
  rds_egress_rules_ipv4                                  = [0]
  rds_egress_cidr_blocks_ipv4                            = ["0.0.0.0/0"]
  rds_egress_rules_from_port_ipv4                        = [0]
  rds_egress_rules_to_port_ipv4                          = [0]
  rds_egress_rules_protocols_ipv4                        = ["-1"]
  storage_encrypted                                      = false
  ingress_rule_database_port                             = 5432
  ingress_rule_port_protocol                             = "tcp"
  db_instance_identifier                                 = "devops-fullstack-app-db"
  allocated_storage                                      = 20
  max_allocated_storage                                  = 50
   
  storage_type                                           = "gp2"
  engine                                                 = "postgres"
  engine_version                                         = "16.2"
  instance_class                                         = "db.t3.micro"
  db_username                                            = "test"
  db_password                                            = "test1234"
  backup_retention_period                                = 7
  backup_window                                          = "06:00-07:00"
  maintenance_window                                     = "Sun:00:00-Sun:01:00"
  skip_final_snapshot                                    = true
  final_snapshot_identifier                              = "devops-fullstack-app-rds-snapshot"
  monitoring_interval                                    = 60
  performance_insights_enabled                           = true
  db_subnet_group_name                                   = "devops-fullstack-app-subnet-group"
  db_subnet_group_tag_name                               = "devops-fullstack-app-subnet-group"
  enabled_cloudwatch_logs_exports                         = ["postgresql", "upgrade"]
  deletion_protection                                    = true
  allow_major_version_upgrade                            = false
  apply_immediately                                      = false
  copy_tags_to_snapshot                                  = true
  publicly_accessible                                    = true
  parameter_group_name                                   = "devops-fullstack-app-parameter-group"
  parameter_group_family                                 = "postgres16"
  parameter_name                                         = "rds.force_ssl"
  parameter_value                                        = "0"
  parameter_apply_method                                 = "immediate"
}

module "ec2" {
  source                         = "../modules/ec2"

  instance_type                  = "t2.small"
  subnets_id                     = module.vpc.subnets_id[1]
  ami                            = "ami-0c7217cdde317cfec"
  vpc_id                         = module.vpc.vpc_id
  ec2_security_group_name        = "ec2_sg"
  ec2_ingress_rules              = [80, 22, 5432, 8080, 3000]
  ec2_ingress_cidr_blocks        = ["0.0.0.0/0"]
  ec2_ingress_rules_from_port    = [80, 22, 5432, 8080, 3000]
  ec2_ingress_rules_to_port      = [80, 22, 5432, 8080, 3000]
  ec2_ingress_rules_protocols    = ["tcp", "tcp", "tcp", "tcp", "tcp"]
  ec2_egress_rules               = [0]
  ec2_egress_cidr_blocks         = ["0.0.0.0/0"]
  ec2_egress_rules_from_port     = [0]
  ec2_egress_rules_to_port       = [0]
  ec2_egress_rules_protocols     = ["-1"]
  aws_key_pair_name              = "tfkey"
  local_private_key_file_name    = "tfkey" 
  private_key_algorithm          = "RSA"
  private_key_rsa_bits           = 4096
  instance_count                 = 1
  instance_name                  = ["devops-fullstack-app"] 
  security_group_name            = "ec2-instance-sg" 
}
