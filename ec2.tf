resource "aws_security_group" "code-challenge" {
  name = "code-challenge"
  id = "code-challenge-security-group"
  description = "Initial Security group"
  vpc_id = ""
}

resource "aws_security_group_rule" "ssh_ingress_access" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "code-challenge-security-group"
  cidr_blocks = [ "0.0.0.0/0" ] 
}

resource "aws_security_group_rule" "egress_access" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "code-challenge-security-group"
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_instance" "web" {

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} >> /tmp/publicip"
  }

  instance_type = "t2.micro"
  vpc_security_group_ids = [ "code-challenge-security-group" ]
  associate_public_ip_address = true
  key_name = "aws"
  tags {
    Name = "code-challenge"
  }
  ami = "ami-097834fcb3081f51a"
  availability_zone = "us-east-1c"
}
