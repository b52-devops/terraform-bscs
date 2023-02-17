#Declaring the data source  
data "aws_ami" "lab-image" {
most_recent      = true
name_regex       = "b52-ansible-dev-17feb2023-dj"
}
