#Creates ec2 instance
resource "aws_instance" "my-ec2" {
    ami                     = data.aws_ami.lab-image.image_id
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [var.sg]
}

# Before you use the variable from the root module, ensure you declare an empty variable.
variable "sg" {}

output "public_ip_address" {
    value = aws_instance.my-ec2.public_ip
}