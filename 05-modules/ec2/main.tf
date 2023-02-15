#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = "ami-086655dc1dd51601a"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [var.sg]
}

# Before you use the variable from the root module, ensure you declare an empty variable.
variable "sg" {}

output "public_ip_address" {
    value = aws_instance.my-ec2.public_ip
}