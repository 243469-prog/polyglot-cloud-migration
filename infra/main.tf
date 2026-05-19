# 1. Create a Security Group (Firewall) for our app tiers
resource "aws_security_group" "app_sg" {
  name        = "polyglot-app-security-group"
  description = "Allow inbound web traffic to application tiers"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Nginx base port
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Frontend application port
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # .NET API Backend port
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Secure Shell (SSH) access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Provision the Virtual Machine (EC2 Instance)
resource "aws_instance" "app_server" {
  ami           = "ami-0c7217cdde317cfec" # Canonical Ubuntu LTS 22.04
  instance_type = "t2.micro"             # Free-tier eligible size
  
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = var.instance_name
    Environment = "DevOps-Assignment"
  }
}