## Values are just for the refernce, we can go as we like".

# Variables values for VPC Module
vpc_cidr_block            = "11.0.0.0/16"
vpc_name                  = "deploy_eks_using_tf_jenkins_vpc"
vpc_igw                   = "deploy_eks_using_tf_jenkins_vpc_igw"
env_name                  = "dev-environment"
cidr_block_pub_subnet     = "11.0.1.0/24"
availability_zone_pub_sub = "ap-south-1a"
public_subnet_name        = "eks-tf-public_subnet"
sg_tag_name               = "eks-tg_SG"
sg_name                   = "eks-tg_SG"
cidr_block_pvt_subnet     = "11.0.4.0/24"
availability_zone_pvt_sub = "ap-south-1b"
private_subnet_name       = "eks-tf-private_subnet"
route_table_name          = "deploy_eks_using_tf_jenkins_vpc_route_tale"
#public_access_cidrs         = ["0.0.0.0/0"]


# Variables values for EC2 Module
ami-ID        = "ami-0e4fd655fb4e26c30" #amazon ami
instance_type = "t2.micro"
key_name      = "mumbai"
ec2-01_name   = "deploy_eks_using_tf_jenkins_ec2"
ec2_env_name  = "development-team"    