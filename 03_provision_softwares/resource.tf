
resource "aws_key_pair" "provision_key" {
    key_name = "provision_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "linux" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.provision_key.key_name

  tags = {
    Name = "debianOS"
  }

  security_groups = "${var.SECURITY_GROUPS}"

  provisioner "file" {
      source = "nginx.sh"
      destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/nginx.sh",  # Remove the spurious CR characters.
      "sudo /tmp/nginx.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}