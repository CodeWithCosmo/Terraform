resource "aws_instance" "nodes" {
  count         =  2
  ami           = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"	
  tags = {
    
    Name = "node${count.index+1}"
  }
}