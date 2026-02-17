resource "aws_instance" "web1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [aws_security_group.alb_sg.id]
  key_name               = aws_key_pair.my_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              echo "Hello from WEB-1" > /var/www/html/index.html
              systemctl enable nginx
              systemctl restart nginx
              EOF

  tags = {
    Name = "${var.project_name}-web-1"
  }
}

resource "aws_instance" "web2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet_2.id
  vpc_security_group_ids = [aws_security_group.alb_sg.id]
  key_name               = aws_key_pair.my_key.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              echo "Hello from WEB-2" > /var/www/html/index.html
              systemctl enable nginx
              systemctl restart nginx
              EOF

  tags = {
    Name = "${var.project_name}-web-2"
  }
}
