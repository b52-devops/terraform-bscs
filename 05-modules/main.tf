module "ec2" {
    source  = "./ec2"
    sg      = module.sg.sg_id           # Taking the output of sg module as an input to the ec2 module
}

module "sg" {
    source = "./sg"
}

output "public_ip" {
    value = module.ec2.public_ip_address
}

# Patching of your EC2 & AMI has to be taken care as a part of the monthly maintenance.

# How do we patch the AMI ???
### Answer : Make an instance out of that AMI, update the server with latest pathces; Then , make AMI out of it with the same name and then deresigter the old AMI.
#### Airlines-Proj-X-1-Feb ;  Airlines-Proj-X-2-Mar ;

# PS : If you keep the provisioner inside the resource, if the provisioner fails for any reason, it assumes that the whole block is a failure and then it destroy and recreates in the next run.
