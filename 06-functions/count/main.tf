provider "aws" {
    region = "us-east-1"
}

#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    count                   = length(var.envs)              #lngth gives the length of the variable
    ami                     = "ami-086655dc1dd51601a"
    instance_type           = "t2.micro"

    tags = {
        Name = var.envs[count.index]
    }
}

output "public_ip" {
    value = aws_instance.my-ec2.*.public_ip
}

variable "envs" {
    default = ["dev", "qa", "stage", "prod"]
}