resource "aws_instance" "testec2-1" {
  ami           = var.ami-ubuntu
  subnet_id     = aws_subnet.public-subnet.id
  instance_type = var.free-tier-instance
  key_name      = var.key-pair
 
  vpc_security_group_ids = [aws_security_group.learn-sg.id]
  associate_public_ip_address = "true"
  user_data = file("${path.module}/user_data.sh")


  tags = {
    Name = "my-ec2-1"
    team = "demo-sjce"
  }
}

resource "aws_instance" "testec2-2" {
  ami           = var.ami-ubuntu
  subnet_id     = aws_subnet.public-subnet-2.id
  instance_type = var.free-tier-instance
  key_name      = var.key-pair
 
  vpc_security_group_ids = [aws_security_group.learn-sg.id]
  associate_public_ip_address = "true"
  user_data = file("${path.module}/user_data.sh")


  tags = {
    Name = "my-ec2-2"
    team = "demo-sjce"
  }
}


resource "aws_security_group" "learn-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.myVPC.id

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.learn-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow-http" {
  security_group_id = aws_security_group.learn-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}