#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = "ami-00e87074e52e6c9f9"
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_ssh.id]
}
