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
        Name = "Subnet_Class2_publick"
    }
}

resource "aws_subnet" "subnet2" {

    vpc_id = aws_vpc.class2_VPC.id
    cidr_block = var.cidr_block1
    availability_zone = var.az_subnet1

    tags = {
        Name = "Subnet_Class2_private"
    }
}

 resource "aws_internet_gateway" "igw" {

    vpc_id = aws_vpc.class2_VPC.id

    tags = {
        Name = "IGW_Class2"
    }
 }


resource "aws_eip" "nat_eip" {
  domain = "vpc"  # обязательно для NAT в VPC
}


resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet1.id  # public subnet

  tags = {
    Name = "NAT_GW_Class2"
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

 

resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.class2_VPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "RouteTable_Class2_Private"
  }
}


resource "aws_route_table_association" "subnet_assoc" {

    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "subnet_assoc_private" {

    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rt_private.id
}

