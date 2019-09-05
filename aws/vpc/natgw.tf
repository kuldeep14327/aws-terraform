resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.nat-gw.id}"
  subnet_id     = "${aws_subnet.subnets[0].id}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags = {
    Name              = "${var.Project} NGW"
    Project           = "${var.Project}"
    Owner             = "${var.IM}"
    Category          = "Internet Gateway"
  }
}