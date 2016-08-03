variable "aws_region" {
    default = "us-east-1"
}
variable "aws_profile" {
    default = "default"
}
variable "prefix" {
    description = "Names for all resources will be prefixed with this\nUseful for developers"
}
provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.aws_profile}"
}
resource "aws_s3_bucket" "tf_fail_bucket" {
    bucket = "${var.prefix}tf_fail_bucket2"
    tags {
        Name = "${var.prefix} Bucket"
        Environment = "dev"
    }

    provisioner "local-exec" {
        command = "PREFIX=${var.prefix} provision/subtf"
    }
}
