variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
ariable "PATH_TO_PRIVATE_KEY" {
  default = "masterkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "masterkey.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
  }
}
variable "AWS_EC2_INSTANCE" {
  default = "t2.micro"
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
