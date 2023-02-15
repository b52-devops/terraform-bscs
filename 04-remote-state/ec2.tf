#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = "ami-086655dc1dd51601a"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "terraform-server"
    }
}

#printing the public ip address of the machine

# output "public_dns_output" {
#     value = aws_instance.my-ec2.public_dns
# }
