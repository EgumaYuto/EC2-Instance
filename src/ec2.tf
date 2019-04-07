resource "aws_instance" "instance" {
  ami = "ami-0f9ae750e8274075b"
  instance_type = "t2.micro"

  key_name = "myFirstKey"

  security_groups = [
    "${aws_security_group.allow-ssh-access.id}",
  ]
  subnet_id = "${aws_subnet.subnet-1a.id}"

  tags = {
    Name = "${terraform.workspace}-instance"
  }
}

resource "aws_security_group" "allow-ssh-access" {
  name = "${terraform.workspace}-allow-ssh-access"
  description = "allow ssh access for ${terraform.workspace}"
  vpc_id = "${var.vpc_id}"

  ## for ssh
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${terraform.workspace}-allow-ssh-access"
  }
}
