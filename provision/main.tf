variable "prefix" {}
resource "aws_s3_bucket" "subbucket" {
    bucket = "${var.prefix}tf_fail_subbucket"
    tags {
        Name = "${var.prefix} Sub Bucket"
        Environment = "dev"
    }
}
