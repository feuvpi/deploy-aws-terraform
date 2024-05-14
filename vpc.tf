
# terraform aws create vpc
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

# create internet gateway and attach it to vpc
## Provides a resource to create a VPC Internet Gateway.
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-vpc internet gateway"
  }
}

# create public subnet az1
## terraform create subnet
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-vpc public subnet az1"
  }
}

# create public subnet az2
## terraform create subnet
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "my-vpc public subnet az2"
  }
}

