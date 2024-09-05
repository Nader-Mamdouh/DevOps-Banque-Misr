# ------------------------------------
# Create the VPC
resource "aws_vpc" "Macarious_VPC" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

########                         PUBLIC Creation                  ******************************************

# Create public subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.Macarious_VPC.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

# Create the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Macarious_VPC.id

  tags = {
    Name = "Macarious_VPC-IGW"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.Macarious_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Macarious_VPC-Public-RT"
  }
}

# Route Table Association for Public Subnets
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}


########                         PRIVATE Creation                  ******************************************

# Create private subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.Macarious_VPC.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "NAT-EIP"
  }
}

# Create the NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Macarious_VPC-NAT-Gateway"
  }
}

# Route Table for Private Subnets
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.Macarious_VPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Macarious_VPC-Private-RT"
  }
}

# Route Table Association for Private Subnets
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
