module "ec2" {
    source  = "./ec2"
    sg      = module.sg.sg_id           # Taking the output of sg module as an input to the ec2 module
}

module "sg" {
    source = "./sg"
}

output "public_ip {
    value = module.ec2.public_ip_address
}"