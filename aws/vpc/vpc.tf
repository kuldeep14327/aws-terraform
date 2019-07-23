resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true 

  tags = {
    Name = "${var.Project} VPC"
    Project = "${var.Project}"
    Owner = "${var.IM}"
  }
}
resource "aws_subnet" "subnet" {
  count               = "${length(var.subnet_names)}"
  vpc_id              = "${aws_vpc.vpc.id}"
  availability_zone   = "${data.aws_availability_zones.inno-az.names[0]}"
  cidr_block          = "${cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index+1)}"
  tags = {
    Name              = "${var.Project} ${element(keys(var.subnet_names), count.index)}"
    Project           = "${var.Project}"
    Owner             = "${var.IM}"

  }
  
}





