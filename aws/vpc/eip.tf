resource "aws_eip" "nat-gw" {
    vpc        =    true
    tags = {
        Name              = "${var.Project} IGW}"
        Project           = "${var.Project}"
        Owner             = "${var.IM}"
        Category          = "EIP"
        }
}
