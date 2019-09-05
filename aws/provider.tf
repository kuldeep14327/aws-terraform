provider "aws" {
  region    = "${var.region}"
  version   = "~> 2.0"
  profile   = "abc"
  assume_role {
    role_arn     = "xyz"
    session_name = ""
    external_id  = ""
  }
}
