provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0ab193018f3e9351b"
  instance_type = "t3.micro"

  tags = {
    Name = "ansible test server"
  }

  key_name = aws_key_pair.web.id

  vpc_security_group_ids = [aws_security_group.ssh-access.id, aws_security_group.httpd-access.id]
}

resource "aws_key_pair" "web" {
  public_key = file("/Users/seungjoonlee/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "httpd-access" {
  name = "httpd-access"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

output "publicip" {
  value = aws_instance.web.public_ip
}