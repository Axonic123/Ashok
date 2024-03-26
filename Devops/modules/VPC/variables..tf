variable "vpc_name" {
  description = "The name for the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. This defines the IP address range for the entire VPC."
  type        = string
}

variable "internet_gateway_name" {
  description = "The name for the Internet Gateway (IGW)."
  type        = string
}

variable "public_route_table_name" {
  description = "The name for the public subnet route table."
  type        = string
}

variable "subnets" {
  description = "List of subnets with names, availability-zones and CIDR blocks"
  type        = list(object({
    name      = string
    cidr      = string
    availability_zones = string
  }))
}
