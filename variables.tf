

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string

}

variable "az_subnet" {
  type    = string
}


variable "cidr_block" {
  type        = string
  description = "CIDR block for subnet"
}


variable "az_subnet1" {
  type    = string
}

variable "cidr_block1" {
  type        = string
  description = "CIDR block for subnet"
}