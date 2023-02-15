provider "aws" {
    region = "us-east-1"
}

#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = "ami-086655dc1dd51601a"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "terraform-server"
    }
}

#Create security group
resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"

    ingress {
        description      = "SSH from public"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]             # [] represents list
    }

    ingress {
        description      = "HTTP from public"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]             # [] represents list
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh_sg"
    }
}


#printing the public ip address of the machine

output "public_dns_output" {
    value = aws_instance.my-ec2.public_dns
}
