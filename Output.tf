output "vpc_id" {
    value = aws_vpc.class2_VPC.id
}
output "vpc_cidr" {
    value = aws_vpc.class2_VPC.cidr_block
}

output "subnet_id" {
    value = aws_subnet.subnet1.id
}

output "subnet_arn" {
    value = aws_subnet.subnet1.arn
}

