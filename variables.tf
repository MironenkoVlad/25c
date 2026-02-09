

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string

}

variable "az_subnet" {
  type    = string
  default = "us-east-1a"
}


variable "cidr_block" {
  type        = string
  description = "CIDR block for subnet"
}


