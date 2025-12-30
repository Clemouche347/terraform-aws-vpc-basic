variable "project_name" {
  description = "Project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidr" {
  description = "List of public subnet CIDRs"
  type        = list

# validation working only wit Terraform version >= 1.3
  validation {
    condition = length(var.public_subnets_cidr) <= length(data.aws_availability_zones.available.names)
    error_message = "Number of public subnets over available AZ"
  }
}

variable "private_subnet_cidr" {
  description = "CIDR of private subnet"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
