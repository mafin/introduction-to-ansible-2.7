data "aws_key_pair" "ansible-course" {
  key_name   = "ansible-course"
}

resource "aws_instance" "ansible-webserver" {
  ami = "ami-08ca3fed11864d6bb"
  instance_type = "t3.nano"
  count = var.INSTANCE_COUNT
  key_name = data.aws_key_pair.ansible-course.key_name

  subnet_id = aws_subnet.main-public-1.id

  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Type = "ansible-course-instance"
    Name  = "webserver-ansible-${count.index + 1}"
  }
}

resource "aws_instance" "ansible-loadbalancer" {
  ami = "ami-08ca3fed11864d6bb"
  instance_type = "t3.nano"
  key_name = data.aws_key_pair.ansible-course.key_name

  subnet_id = aws_subnet.main-public-1.id

  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Type = "ansible-course-instance"
    Name  = "lb-ansible"
  }
}

resource "aws_security_group" "instance" {
  name = "ansible-course-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port = var.SERVER-PORT
    protocol = "tcp"
    to_port = var.SERVER-PORT
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}
