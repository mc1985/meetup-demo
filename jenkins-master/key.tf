resource "aws_key_pair" "masterkeypair" {
  key_name = "masterkeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
