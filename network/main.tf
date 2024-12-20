# SHS Acc VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = merge(local.common_tags,
    {
      Name = var.vpc_name
    }
  )
}

# SHS Acc VPC - Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags,
    {
      Name = var.igw_name
    }
  )
}

# Public Routetable
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = merge(local.common_tags,
    {
      Name = var.pub_rt_name
    }
  )
}

# Private Routetable
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags,
    {
      Name = var.prv_rt_name
    }
  )
}


//---
# resource "aws_subnet" "public_subnets" {
#     count = 3
#     vpc_id = aws_vpc.main.id
#     cidr_block = element(var.public_subnets, count.index)
#     availability_zone = element(var.availability_zones, count.index)
#     tags = {var.public_subnet_name}-num-${count.index}

//---
# Public Subnet 1 
resource "aws_subnet" "pub_subnet_1" {
  count = 3
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_subnet_1_cidr
  tags = merge(local.common_tags,
    {
      Name = "{var.pub_subnet_1_name}-num-${count.index}"
    }
  )
}

# Public Subnet 1 - Association
resource "aws_route_table_association" "pub_subnet_1" {
  count = length(var.pub_subnet_1_cidr)
  subnet_id      = aws_subnet.pub_subnet_1[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Private Subnet 1 
resource "aws_subnet" "prv_subnet_1" {
  count = 3
  vpc_id     = aws_vpc.main.id
  cidr_block = var.prv_subnet_1_cidr
  tags = merge(local.common_tags,
    {
      Name = "{var.prv_subnet_1_name}-num-${count.index}"
    }
  )
}

# Private Subnet 1 - Association
resource "aws_route_table_association" "prv_subnet_1" {
  count = length(var.prv_subnet_1_cidr)
  subnet_id      = aws_subnet.prv_subnet_1[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}