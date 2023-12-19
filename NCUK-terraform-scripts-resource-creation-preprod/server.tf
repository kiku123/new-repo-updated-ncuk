data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.2.20231113.0-kernel-6.1-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "NCUK-jenkins-preprod" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type  = var.NCUK-instance-type-preprod
<<<<<<< HEAD
  key_name                    = "ncuk-pre-prod-key"
=======
  key_name                    = "fill-in-the-key-name-here"
>>>>>>> origin
  subnet_id                   = aws_subnet.NCUK-public-subnet-preprod-1
  vpc_security_group_ids      = [aws_default_security_group.NCUK-default-sg-preprod.id]
  availability_zone           = var.NCUK-availability-zone-preprod
  associate_public_ip_address = true
<<<<<<< HEAD
  user_data                   = file("jenkins-server-setup.sh")
=======
  user_data                   = file("jenkins-ser-setup.sh")
>>>>>>> origin
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-server"
  }
}

output "ec2_public_ip" {
  value = aws_instance. NCUK-preprod.public_ip
}

