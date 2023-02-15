variable "City" {}  # This is how we declare an empty variable

output "city-name" {
    value = "Name of the city is ${var.City}"
}

variable "State" {}

output "state-name" {
    value = "Name of the state is ${var.State}"
}

variable "Project" {}

output "project" {
    value = "Name of the project is ${var.Project}"
}


# Always ensure to declare an empty variable before you use it 