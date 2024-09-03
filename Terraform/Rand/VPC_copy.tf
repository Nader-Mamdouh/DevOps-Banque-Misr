# Create the VPC
resource "aws_vpc" "Macarious_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Main-VPC"
  }
}

########                         PUBLIC Creation                  ******************************************

# Create public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.Macarious_VPC.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.Macarious_VPC.id
  cidr_block        = "10.0.3.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-2"
  }
}
# Create the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Macarious_VPC.id

  tags = {
    Name = "Main-IGW"
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
    Name = "Public-RT"
  }
}

# Route Table Association for Public Subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}


########                         PRIVATE Creation                  ******************************************

# Create private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.Macarious_VPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.Macarious_VPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Private-Subnet-2"
  }
}


# Create the NAT Gateway Elastic IP
# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

# Create the NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Main-NAT-Gateway"
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
    Name = "Private-RT"
  }
}

# Route Table Association for Private Subnets
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
}
