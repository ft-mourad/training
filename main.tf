#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-2d4f8564
#
# Your security group ID is:
#
#     sg-6da31b17
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     ttt-eccbc87e4b5ce2fe28308fd9f2a7baf3
#


variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web"{
  ami ="ami-db24d8b6"
  instance_type="t2.micro"
  subnet_id="subnet-2d4f8564"
  vpc_security_group_ids=["sg-6da31b17"]

  count = 1
  tags {
	Identity = "ttt-eccbc87e4b5ce2fe28308fd9f2a7baf3"
	Name = "Mourad"
	Type = "training"
  }
}

output "public_ip" {
	value = ["${aws_instance.web.*.public_public}"]
}

output "public_dns" {
	value = ["${aws_instance.web.*.public_dns}"]
}
