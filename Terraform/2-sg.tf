resource "aws_security_group" "aws_project_sg_ec2" {
  name        = "aws_project_sg_ec2"
  description = "Permite SSH e HTTP na instancia EC2"
  vpc_id      = aws_vpc.aws_project_vpc.id

	ingress {
		description = "SSH to EC2"
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		description = "HTTP to EC2"
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aws_project"
  }
}


resource "aws_security_group" "aws_project_sg_elb" {
  name        = "aws_project_sg_elb"
  description = "Permite HTTP no ELB"
  vpc_id      = aws_vpc.aws_project_vpc.id


	ingress {
		description = "HTTP to ELB"
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aws_project"
  }
}
