# Creating EC2 Instance
resource "aws_instance" "ec2-tf-001" {

    availability_zone = data.aws_availability_zones.azs.names[0]
    ami               = var.ami-ID
    instance_type     = var.instance_type
    key_name          = var.key_name
    vpc_security_group_ids = [aws_security_group.eks-tg_SG.id]
    subnet_id         = var.public_subnet.id
    monitoring        = true
    user_data         = file("/modules/EC2/installjenkins.sh")
    associate_public_ip_address = true

    tags = {
      Name = var.ec2-01_name
      env  = var.ec2_env_name
    }
}