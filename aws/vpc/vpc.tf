resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true 

  tags = {
    Name = "${var.Project} VPC"
    Project = var.Project
    Owner = var.IM
  }
}
resource "aws_subnet" "subnets" {
  count               = length(var.subnets)
  vpc_id              = aws_vpc.vpc.id
  availability_zone   = data.aws_availability_zones.az.names["${var.subnet_az["${element(var.subnets, count.index)}"]}"]
  cidr_block          = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  tags = {
    Name              = "${var.Project} ${element(var.subnets, count.index)}"
    Project           = var.Project
    Owner             = var.IM
  }
}