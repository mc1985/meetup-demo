resource "aws_instance" "server" {
    ami = "${lookup(var.ami, "${var.region}-${var.platform}")}"
    instance_type = "${var.instance_type}"
    count = "${var.servers}"

    #Instance tags
    tags {
        Name = "${var.tagName}-${count.index}"
    }

}
