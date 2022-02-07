resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]  # it is under third bracket means it is a array, but in this example there is only one value.

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}

