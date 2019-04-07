resource "aws_subnet" "subnet-1a" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "172.31.0.0/20"

  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${terraform.workspace}-subnet-1a"
  }
}
