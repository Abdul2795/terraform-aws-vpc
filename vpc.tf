resource "aws_vpc" "kubernetes_from_scratch"{
    cidr_block = var.address_space
    instance_tenancy = "default"
    tags = {
        Name = "kubernetes_from_scratch"
        Owner = "shoaib"
    }
}
 resource "aws_subnet" "public_subnet_01" {
    vpc_id     = aws_vpc.kubernetes_from_scratch.id
    cidr_block = var.public_subnet_01
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "public-subnet-01"
        Owner = "shoaib"
    }
}
resource "aws_subnet" "public_subnet_02" {
    vpc_id     = aws_vpc.kubernetes_from_scratch.id
    cidr_block = var.public_subnet_02
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "public-subnet-02"
        Owner = "shoaib"
    }
}
resource "aws_subnet" "private_subnet_01" {
    vpc_id = aws_vpc.kubernetes_from_scratch.id
    cidr_block = var.private_subnet_01
    availability_zone = "ap-south-1a"
    tags = {
        Name = "private-subnet-01"
        Owner = "shoaib"
    }  
}
 resource "aws_subnet" "private_subnet_02" {
    vpc_id = aws_vpc.kubernetes_from_scratch.id
    cidr_block = var.private_subnet_02
    availability_zone = "ap-south-1b"
    tags = {
        Name = "private-subnet-02"
        Owner = "shoaib"
    }  
} 
resource "aws_subnet" "db_subnet" {
    vpc_id = aws_vpc.kubernetes_from_scratch.id
    cidr_block = var.db_subnet
    availability_zone = "ap-south-1b"
    tags = {
        Name = "db-subnet"
        Owner = "shoaib"
    }  
}
resource "aws_internet_gateway" "k8_igw" {
  vpc_id = aws_vpc.kubernetes_from_scratch.id
  tags = {
    Name = "k8_igw"
    Owner = "shoaib"
  }
}
resource "aws_nat_gateway" "k8_ngw" {
    subnet_id = aws_subnet.public_subnet_01.id
    connectivity_type = "public"
    tags = {
      Name = "k8_ngw"
      Owner = "shoaib"
    }
    }

   