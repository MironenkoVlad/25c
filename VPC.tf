provider "aws" {
  region = var.region 
}

resource "aws_vpc" "class2_VPC" {
    cidr_block = var.vpc_cidr
  
  tags = {
    Name = "class2-vpc"
  }
}

resource "aws_subnet" "subnet1" {

    vpc_id = aws_vpc.class2_VPC.id
    cidr_block = var.cidr_block
    availability_zone = var.az_subnet

    tags = {
        Name = "Subnet_Class2"
    }
}







