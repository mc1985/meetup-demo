resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "${lookup(var.AWS_EC2_INSTANCE)}"
}
