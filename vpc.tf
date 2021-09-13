# network.tf

resource "aws_vpc" "single-node-vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_default_vpc" "default_vpc" {
}

resource "aws_default_subnet" "default_subnet_a"{
    availability_zone = "us-west-2a"
}

resource "aws_default_subnet" "default_subnet_b"{
    availability_zone = "us-west-2b"
}

resource "aws_default_subnet" "default_subnet_c"{
    availability_zone = "us-west-2c"
}

# Fetch AZs in the current region
data "aws_availability_zones" "available" {
}


# Create var.az_count private subnets, each in a different AZ
resource "aws_subnet" "private" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.single-node-vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.single-node-vpc.id
}

# Create var.az_count public subnets, each in a different AZ
resource "aws_subnet" "public" {
  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.single-node-vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.single-node-vpc.id
  map_public_ip_on_launch = true
}




