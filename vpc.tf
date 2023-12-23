# create vpc
resource "aws_vpc" "my_vpc1" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.Name
  }
}

# create sous-reseau public // ca-central-1a
resource "aws_subnet" "pub-sub-vpc" {
  vpc_id                  = aws_vpc.my_vpc1.id
  cidr_block              = "18.0.14.0/23"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# Create Internet Passerelle
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc1.id
}

# Create route table

resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.my_vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

/*
  route {
  ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }
*/

  tags = {
    Name = "demo-rt"
  }
}

// associate subnet  with route table

resource "aws_route_table_association" "demo_rt_associate" {
  subnet_id      = aws_subnet.pub-sub-vpc.id
  route_table_id = aws_route_table.demo-rt.id
}