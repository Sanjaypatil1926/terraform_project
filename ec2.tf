provider "aws" {
    region = "eu-west-3"
}

variable "subnet_cidr_block" {
    description = "subnet cidr block"
}


resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name: "devolopment"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "eu-west-3a"
}

data "aws_vpc" "existing_vpc" {
    default = true
}

output "dev-vpc-id" {
    value = aws_vpc.development-vpc.id
  
}

output "dev-subnet-id" {
    value = aws_subnet.dev-subnet-1.id
}   