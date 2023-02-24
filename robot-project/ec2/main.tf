#Creates ec2 spot instance

# Request a spot instance at $0.03
# resource "aws_spot_instance_request" "my_spot_server" {
#     ami                     = data.aws_ami.lab-image.image_id
#     instance_type           = "t3.micro"
#     vpc_security_group_ids  = [aws_security_group.allow_all.id]
#     wait_for_fulfillment    = true          # Terraforn job will only be completed if the request is fulfilled. If not, it waits or 10 minutes and then timeout

#     tags = {
#         Name = var.COMPONENT
#     }

#     provisioner "remote-exec" {
#         connection {
#         type     = "ssh"
#         user     = "centos"
#         password = "DevOps321"
#         host     = self.private_ip         # self. will only work if it's inside the resource ; If not, we need to use aws_instance.my-ec2.public_ip
#         }

#         inline = [
#             "ansible-pull -U https://github.com/jaindeepak2008/ansible-b52.git -e COMPONENT=frontend  -e APP_VERSION=${var.APP_VERSION} -e ENV=dev robot-pull.yml"
#         ]
#     }
# }

resource "aws_instance" "my-ec2" {
    ami                     = data.aws_ami.lab-image.image_id
    instance_type           = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.allow_all.id]

    tags = {
        Name = var.COMPONENT
    }

    provisioner "remote-exec" {
        connection {
        type     = "ssh"
        user     = "centos"
        password = "DevOps321"
        host     = self.private_ip         # self. will only work if it's inside the resource ; If not, we need to use aws_instance.my-ec2.public_ip
        }

        inline = [
                "ansible-pull -U https://github.com/jaindeepak2008/ansible-b52.git -e COMPONENT=frontend  -e APP_VERSION=${var.APP_VERSION} -e ENV=dev robot-pull.yml"
        ]
    }
}
