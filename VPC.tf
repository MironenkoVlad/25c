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
 resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.class2_VPC.id

    tags = {
        Name = "IGW_Class2"
    }
 }

 resource "aws_route_table" "rt" {

    vpc_id = aws_vpc.class2_VPC.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "RouteTable_Class2"
    }
 }


resource "aws_route_table_association" "subnet_assoc" {

    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rt.id
}