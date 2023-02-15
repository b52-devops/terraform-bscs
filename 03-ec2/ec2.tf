provider "aws" {
    region = "us-east-1"
}

#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = "ami-00e87074e52e6c9f9"
    instance_type           = "t2.micro"

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
