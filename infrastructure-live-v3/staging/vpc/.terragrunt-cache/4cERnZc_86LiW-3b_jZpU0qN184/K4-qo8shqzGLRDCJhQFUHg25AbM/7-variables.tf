variable "env" {
  description = "Environment name."
  type = string
}

variable "vpc_cidr_block" {
    description = "CIDR (Classless Inter-Domain Routing) block for the VPC."
    type = string
    default = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones to use for the subnets."
  type = list(string)
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets."
  type = list(string)
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets."
  type = list(string)
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets."
  type = map(string)
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets."
  type = map(string)
}