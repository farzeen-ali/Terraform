provider "aws" {
    region = "eu-north-1"
}

resource "aws_instance" "my_ec2" {
    ami = "ami-05fcfb9614772f051"
    instance_type = "t3.micro"
    tags = {
        Name = "MyFirstTerraformEC2"
    }
}