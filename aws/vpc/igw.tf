resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name              = "${var.Project} IGW}"
    Project           = "${var.Project}"
    Owner             = "${var.IM}"

  }
}