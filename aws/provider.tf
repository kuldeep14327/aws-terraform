provider "aws" {
  region       = "${var.region}"
  version = "~> 2.0"
  profile = "auth-internal"
  assume_role {
    role_arn     = ""
    session_name = ""
    external_id  = ""
  }
}