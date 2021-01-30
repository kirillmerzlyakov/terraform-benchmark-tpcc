resource "aws_instance" "ubuntu" {
  ami                         = data.aws_ami.latest_ubuntu.id
  instance_type               = var.instance_type
  user_data                   = file("./scripts/start_apache.sh")
  key_name                    = "terraform-test"
  subnet_id                   = aws_subnet.subnet1.id
  private_ip                  = "10.0.0.50"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my_sg.id]

  tags = {
    Name    = "My ubuntu"
    Project = "TPC-C test"
  }
}
