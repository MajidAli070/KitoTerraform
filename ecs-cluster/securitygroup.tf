resource "aws_security_group" "api_sg" {
  name        = "nginx-sg"
  description = "use for nginx deployment ecs"
  vpc_id      = "vpc-0f95db2f47b2c74be"

  # Port 80 — dusre security groups se
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["sg-09861acb87226fd27", "sg-056fea28228842966"]
  }

  # Port 8000 — ek security group se
  ingress {
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    security_groups = ["sg-09861acb87226fd27"]
  }

  # Port 443 — ek SG se + VPC range se
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["sg-09861acb87226fd27"]
    cidr_blocks     = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}