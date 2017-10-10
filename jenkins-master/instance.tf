resource "aws_key_pair" "jenkinskey" {
  key_name = "jenkinskey" 
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "Jenkins" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "${lookup(var.AWS_EC2_INSTANCE)}"
  key_name = "${aws_key_pair.jenkinskey.key_name}"
}

provisioner "local-exec" { 
  command = "sleep 30 && echo -e \"[Jenkins]\n${aws_instance.Jenkins.public_ip} ansible_connection=ssh ansible_ssh_user=root\" > inventory &&  ansible-playbook -i inventory ./ansible/playbook.yml"
}
