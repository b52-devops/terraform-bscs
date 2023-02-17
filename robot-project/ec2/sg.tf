
#Create security group
resource "aws_security_group" "allow_all" {
    name        = "allow_${var.COMPONENT}"
    description = "Allow SSH inbound traffic"

    ingress {
        description      = "SSH from public"
        from_port        = 0
        to_port          = 0
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
        Name = "allow-${var.COMPONENT}"
    }
}