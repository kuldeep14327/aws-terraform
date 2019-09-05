variable "Project" {
    type = "string"
    default = "test"
    description = "Project or Customer Name"
}

variable "IM" {
    type = "string"
    default = "John"
    description = "Name of Project IM"
}

variable "region" { 
    type = "string"
    default  = "us-east-1"
    description = "Region for the VPC"
}

variable "vpc-cidr" {
    type = "string"
    default = "10.0.0.0/16"
    description = "CIDR value for VPC"
}

variable "subnets" {
    type = list(string)
    default = [ "DMZ", "Application", "Database", "Platform", "Redshift-1", "Redshift-2", "Citrix"]
    description = "subnets need to create"
}
variable "subnet_az" {
    type = "map"
    default = {
    DMZ             = 1
    Application     = 0
    Database        = 0
    Platform        = 0
    Redshift-1      = 0
    Redshift-2      = 1
    Citrix          = 0
  }
    description = "number of subnets need to create"
}