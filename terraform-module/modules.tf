module "elasticsearch" {
  source = "modules/elasticsearch"
  key_name = "${aws_key_pair.mykey.key_name}"
  key_path = "${var.PATH_TO_PRIVATE_KEY}"
  region = "${var.AWS_REGION}"
}
