# VPCの作成
# 公式 -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-dev"
  }
}


# subnetの作成
# 公式 -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id            = aws_vpc.vpc-dev.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  # public_ipを割り振る。
  map_public_ip_on_launch = true
  tags = {
    "Name" = "vpc-dev-public-subnet-1"
  }
}


# InternetGatwayの作成
# -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}


# RouteTableの作成
# -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}


# RouteTable中身: インターネットアクセス(ルーティング)
# -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
resource "aws_route" "vpc-dev-public-reoute" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  # 送信先
  destination_cidr_block = "0.0.0.0/0"
  # ターゲット
  gateway_id = aws_internet_gateway.vpc-dev-igw.id
}


# RouteTableの中身: サブネットとの関連付け
# -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "vpc-dev-public-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}


# セキュリティグループの作成
# -> https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "vpc-dev-public-security-group" {
  name        = "dev-vpc-default-sg"
  description = "Dev VPC Default Security Group"
  vpc_id      = aws_vpc.vpc-dev.id

  ingress {
    description = "Allow Port 22"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All outbounds"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


