output "vpc_ID" {
    value = aws_vpc.eks-tf_vpc.id
}

output "cidr_block_pub_subnet" {
    value = aws_subnet.public_subnet.cidr_block
}

output "cidr_block_pvt_subnet" {
    value = aws_subnet.private_subnet.cidr_block
}