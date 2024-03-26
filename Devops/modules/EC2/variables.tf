variable "subnets_id" {
  description = "The ID of the public subnet where resources with public accessibility will be deployed."
  type = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch, e.g., t2.micro, m5.large, etc."
  type        = string
}

variable "ami" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the Virtual Private Cloud (VPC) where the EC2 instance will be launched."
  type        = string
}

variable "ec2_security_group_name" {
  description = "The name of the security group for the EC2 instance."
  type        = string
}

variable "ec2_ingress_rules" {
  description = "A list of ingress rules for the EC2 security group."
  type        = list(string)
}

variable "ec2_ingress_cidr_blocks" {
  description = "List of CIDR blocks for EC2 security group ingress rules."
  type        = list(string)
}

variable "ec2_ingress_rules_from_port" {
  description = "List of from_port values for EC2 security group ingress rules."
  type        = list(number)
}

variable "ec2_ingress_rules_to_port" {
  description = "List of to_port values for EC2 security group ingress rules."
  type        = list(number)
}

variable "ec2_ingress_rules_protocols" {
  description = "List of protocols for EC2 security group ingress rules."
  type        = list(string)
}

variable "ec2_egress_rules" {
  description = "A list of egress rules for the EC2 security group."
  type        = list(string)
}

variable "ec2_egress_cidr_blocks" {
  description = "List of CIDR blocks for EC2 security group egress rules."
  type        = list(string)
}

variable "ec2_egress_rules_from_port" {
  description = "List of from_port values for EC2 security group egress rules."
  type        = list(number)
}

variable "ec2_egress_rules_to_port" {
  description = "List of to_port values for EC2 security group egress rules."
  type        = list(number)
}

variable "ec2_egress_rules_protocols" {
  description = "List of protocols for EC2 security group egress rules."
  type        = list(string)
}

variable "aws_key_pair_name" {
  description = "The name of the AWS Key Pair to associate with the EC2 instance."
  type        = string
}

variable "local_private_key_file_name" {
  description = "The file name of the local private key used to connect to the EC2 instance."
  type        = string
}

variable "private_key_algorithm" {
  description = "The algorithm to use for generating the private key, e.g., RSA, DSA, etc."
  type        = string
}

variable "private_key_rsa_bits" {
  description = "The number of bits for RSA private key generation, e.g., 2048, 4096, etc."
  type        = number
}

variable "instance_count" {
  description = "The number of instances to be created."
  type        = number
}

variable "instance_name" {
  description = "The name of the instances to be created."
  type        = list
}

variable "security_group_name" {
  description = "The name of the security group to be created."
  type        = string 
}
