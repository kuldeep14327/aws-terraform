resource "aws_eip" "nat-gw" {
    vpc        =    true
    tags = {
        Name              = "${var.Project} Nat-EIP}"
        Project           = "${var.Project}"
        Owner             = "${var.IM}"
        Category          = "EIP"
        }
}
