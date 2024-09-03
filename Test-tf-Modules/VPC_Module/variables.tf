variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The list of public subnet CIDR blocks"
  type        = list(string)
}

variable "azs" {
  description = "The list of availability zones"
  type        = list(string)
}
