terraform {
    backend "s3" {
        bucket = "b52-terraform-state-bucket-dj"
        key    = "modules/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {}