resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }
}

resource "aws_route_table_association" "public-subnet" {
  subnet_id      = "${aws_subnet.subnet[0].id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private-subnet" {
  count          = "${length(var.subnet_names)}" 
  subnet_id      = "${aws_subnet.subnet[count.index].id}"
  route_table_id = "${aws_route_table.public.id}"
}