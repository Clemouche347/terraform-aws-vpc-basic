output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}


output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = aws_vpc.this.cidr_block
}


output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = tolist(aws_subnet.public[*].id)
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}


output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}


output "internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the VPC"
  value       = aws_internet_gateway.this.id
}
