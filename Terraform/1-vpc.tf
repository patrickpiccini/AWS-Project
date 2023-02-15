
# Criação da VPC
resource "aws_vpc" "aws_project_vpc" {
	cidr_block            = "10.10.0.0/16"
  instance_tenancy      = "default"
  enable_dns_support    = "true"
  enable_dns_hostnames  = "true"
  

	tags = {
	Name = "aws_project"
	}
}

# Criação das subnets Publicas
resource "aws_subnet" "public_subnet_sa_east_1a" {
  vpc_id                  = aws_vpc.aws_project_vpc.id
  cidr_block              = "10.10.10.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sa-east-1a"
    Name = "aws_project"
  }
}

resource "aws_subnet" "public_subnet_sa_east_1b" {
  vpc_id                  = aws_vpc.aws_project_vpc.id
  cidr_block              = "10.10.20.0/24"
  availability_zone       = "sa-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sa-east-1b"
    Name = "aws_project"
  }
}

resource "aws_subnet" "public_subnet_sa_east_1c" {
  vpc_id                  = aws_vpc.aws_project_vpc.id
  cidr_block              = "10.10.30.0/24"
  availability_zone       = "sa-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sa-east-1c"
    Name = "aws_project"
  }
}


# Criação do Internet Gateway
resource "aws_internet_gateway" "aws_project_igw" {
	vpc_id = aws_vpc.aws_project_vpc.id

	tags = {
	Name = "aws_project_igw"
	Name = "aws_project"
	}
}

# Criação da Tabela de Roteamento
resource "aws_route_table" "aws_project_public_table" {
  vpc_id = aws_vpc.aws_project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_project_igw.id
  }

  tags = {
    Name = "public"
    Name = "aws_project"
  }
}


#Associação da Subnet Pública com a Tabela de Roteamento
resource "aws_route_table_association" "public_sa_east_1a" {
  subnet_id      = aws_subnet.public_subnet_sa_east_1a.id
  route_table_id = aws_route_table.aws_project_public_table.id
}

resource "aws_route_table_association" "public_sa_east_1b" {
  subnet_id      = aws_subnet.public_subnet_sa_east_1b.id
  route_table_id = aws_route_table.aws_project_public_table.id
}

resource "aws_route_table_association" "public_sa_east_1c" {
  subnet_id      = aws_subnet.public_subnet_sa_east_1c.id
  route_table_id = aws_route_table.aws_project_public_table.id
}