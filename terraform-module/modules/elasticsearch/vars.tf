variable "platform" {
  default     = "ubuntu"
  description = "The OS Platform"
}

variable "user" {
  default = {
    ubuntu  = "ubuntu"
  }
}

variable "ami" {
  description = "AWS AMI Id, if you change, make sure it is compatible with instance type, not all AMIs allow all instance types "

  default = {

    us-east-1-ubuntu	  = "ami-d651b8ac"

  }
}


variable "key_name" {
  description = "SSH key name in your AWS account for AWS instances."
}

variable "key_path" {
  description = "Path to the private key specified by key_name."
}

variable "region" {
  default     = "us-east-1"
  description = "The region of AWS, for AMI lookups."
}

variable "servers" {
  default     = "3"
  description = "The number of elastic servers to launch."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS Instance type, if you change, make sure it is compatible with AMI, not all AMIs allow all instance types "
}

variable "tagName" {
  default     = "elastic"
  description = "Name tag for the servers"
}
