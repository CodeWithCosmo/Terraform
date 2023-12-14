data "aws_availability_zones" "available" {}

data "aws_ami_ids" "ubuntu" {
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "nodes" {
  ami           =  data.aws_ami_ids.ubuntu.id
  instance_type = "t2.micro"  
  availability_zone = data.aws_availability_zones.available.names[2]
  tags = {
    
    Name = "node1"
  }
  security_groups = "${var.SECURITY_GROUPS}"
}