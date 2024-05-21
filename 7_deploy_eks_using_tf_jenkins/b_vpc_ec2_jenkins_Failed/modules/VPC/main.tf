# Creating VPC
resource "aws_vpc" "deploy_eks_using_tf_jenkins_vpc" {
    cidr_block = var.vpc_cidr_block
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = var.vpc_name
      env = var.env_name
    }
}

# Creating Public Subnet
resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.deploy_eks_using_tf_jenkins_vpc.id
    cidr_block              = [var.cidr_block_pub_subnet]
    availability_zone       = var.availability_zone_pub_sub
    map_public_ip_on_launch = true

    tags = {
      Name = var.public_subnet_name
      env = var.env_name
    }
}

# Creating Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.deploy_eks_using_tf_jenkins_vpc.id
  cidr_block = [var.cidr_block_pvt_subnet]
  availability_zone = var.availability_zone_pvt_sub

  tags = {
      Name = var.private_subnet_name
      env = var.env_name
    }
}


# Creating Internet Gateway
resource "aws_internet_gateway" "deploy_eks_using_tf_jenkins_vpc_igw" {
    vpc_id = aws_vpc.deploy_eks_using_tf_jenkins_vpc.id

  tags = {
    Name = var.vpc_igw
    env = var.env_name
  }
}

# Creating Route Table
resource "aws_route_table" "route_table_deploy_eks_using_tf_jenkins_vpc" {
    vpc_id = aws_vpc.deploy_eks_using_tf_jenkins_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.deploy_eks_using_tf_jenkins_vpc_igw.id
    }
    
    tags = {
      Name = var.route_table_name
    }
}

# Route Table Association
resource "aws_route_table_association" "RT_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_deploy_eks_using_tf_jenkins_vpc.id
}


# Creating Security Group for EKS cluster
resource "aws_security_group" "eks-tg_SG" {
  name = var.sg_name
  description = "To provide access to laptop."
  vpc_id = aws_vpc.deploy_eks_using_tf_jenkins_vpc.id
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "SSH access to laptop"    
  }

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "HTTP access to laptop"    
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = var.sg_tag_name
    env = var.env_name
  }
}