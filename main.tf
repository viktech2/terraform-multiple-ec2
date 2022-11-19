provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "micro_ec2_instance"{

    count = var.instance_count
    ami = var.instance_ami
    instance_type = "t2.micro"
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.vs_custom_sg.id]
    
    tags = {
      Name = element(var.instance_tags, count.index)
    }

}

resource "aws_instance" "medium_ec2_instance"{

    ami = var.instance_ami
    instance_type = "t2.medium"
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.vs_custom_sg.id]

    tags = {
      Name = "vs-master"
    }

}



resource "aws_security_group" "vs_custom_sg" {

  name = "vs-custom-sg"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}
