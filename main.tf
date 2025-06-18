# provider "aws" {
#     region = "eu-north-1"
# }

# resource "aws_instance" "my_ec2" {
#     ami = "ami-05fcfb9614772f051"
#     instance_type = "t3.micro"
#     tags = {
#         Name = "MyFirstTerraformEC2"
#     }
# }

# Variables
provider "aws" {
    region = var.aws_region
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

    tags = {
        Name = var.instance_name
    }
}