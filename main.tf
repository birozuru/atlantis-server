module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2RHiSovmFWX7qYB0cRB52aXW8SwvYmmqF/kA3L1CqaJBYtKUajJkkXe/BUMl6Q72KzVjTvcmRw8V0eAT9+E3kyG556fIq19QGP2wBCo21L6DLcpR5Pyyd4MB6HGojChk2UjOollAHMZyL90UBwNXavQmp/HrpO/wigDL+X7GV/6fHyNr+Dg2b9TqeLkHhiqT3iXy+dOO+rOWbBrO8P0PbLe2yItqAoDhEwJ8XDbEpPVPNmPVn1SzY/HThj3Tdfov2DUtJSBJ66MiL3wkIZysxBZdOrAE1gbvSiCMjwPjwZXRnJHnN6+Wjug0wrCB7hZJximxKibtOTXJaW0EvrIuZ ubuntu@ip-172-31-44-248"
  attach_admin_policy = true
}

resource "aws_s3_bucket" "birozuru_test_state" {
  bucket = "onyebuchi-test-bucket-2"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
