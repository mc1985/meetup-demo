rresource "aws_instance" "jenkins" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.masterkey.key_name}"

  # user data
  user_data = "${data.template_cloudinit_config.cloudinit-example.rendered}"

}

resource "aws_ebs_volume" "jenkins_home" {
    availability_zone = "us-east-1a"
    size = 20
    type = "gp2"
    tags {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "jenkins_home-attachment" {
  device_name = "${var.INSTANCE_DEVICE_NAME}"
  volume_id = "${aws_ebs_volume.jenkins_home.id}"
  instance_id = "${aws_instance.jenkins.id}"
}
