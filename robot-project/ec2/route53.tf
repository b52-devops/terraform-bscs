resource "aws_route53_record" "component" {
    zone_id = "Z0112540UNPLCQ33VGRQ"
    name    = "${var.COMPONENT}-dev.roboshop.internal"
    type    = "A"
    ttl     = 10
    records = [aws_instance.my-ec2.private_ip]
}