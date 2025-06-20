provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c2b8ca1dad447f8a"  # Ubuntu 22.04 in us-east-1
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "Ansible-EC2-${count.index}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ../ansible/inventory.ini"
  }
}
