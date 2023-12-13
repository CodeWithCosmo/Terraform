resource "aws_instance" "nodes" {
  ami           =  lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"  
  tags = {
    
    Name = "node1"
  }

  security_groups = "${var.SECURITY_GROUPS}"
}