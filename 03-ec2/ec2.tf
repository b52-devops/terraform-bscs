provider "aws" {
    region = "us-east-1"
}

#Creates ec2 instance
resource "aws_instance" "test-server" {
    ami                     = "ami-00e87074e52e6c9f9"
    instance_type           = "t2.micro"

    tags = {
        Name = "terraform-server"
    }
}