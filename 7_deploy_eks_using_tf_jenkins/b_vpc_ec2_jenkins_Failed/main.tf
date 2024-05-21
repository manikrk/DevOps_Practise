# Calling VPC
module "VPC" {
  source                    = "./modules/VPC"
  vpc_cidr_block            = var.vpc_cidr_block # KEY = VALUE pair
  vpc_name                  = var.vpc_name       # KEY = copy each attribute from VPC module "variables.tf" as "KEY"
  vpc_igw                   = var.vpc_igw        # KEY = var.KEY map the key value with "dev-environment" variables.tf   
  env_name                  = var.env_name
  public_subnet_name        = var.public_subnet_name
  availability_zone_pub_sub = var.availability_zone_pub_sub
  cidr_block_pub_subnet     = var.cidr_block_pub_subnet
  private_subnet_name       = var.private_subnet_name
  availability_zone_pvt_sub = var.availability_zone_pvt_sub
  cidr_block_pvt_subnet     = var.cidr_block_pvt_subnet
  route_table_name          = var.route_table_name
  sg_name                   = var.sg_name
  sg_tag_name               = var.sg_tag_name
}

#Calling ec2 Module
module "EC2" {
  source        = "./modules/EC2"
  ami-ID        = var.ami-ID
  instance_type = var.instance_type
  key_name      = var.key_name
  ec2-01_name   = var.ec2-01_name
  ec2_env_name  = var.ec2_env_name
  #vpc_security_group_ids = [aws_security_group.eks-tg_SG.id]
  subnet_id              = aws_subnet.public_subnet.id
}
