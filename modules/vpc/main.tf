resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-vpc"
    }
  )
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets_cidr)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets_cidr[count.index]
  availability_zone = "${var.aws_region}${count.index ==0 ? "a" : "b"}"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-public-${count.index}"
    }
  )
}
