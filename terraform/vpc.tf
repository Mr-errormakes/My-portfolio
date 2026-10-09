resource "aws_vpc" "myVPC" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "11.0.1.0/24"

  tags = {
    Name = "public subnet"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "11.0.2.0/24"

  tags = {
    Name = "private subnet"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "Learn-IGW"
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}
resource "aws_route_table_association" "routetable-associate" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "routetable-associate2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.route-table.id
}





