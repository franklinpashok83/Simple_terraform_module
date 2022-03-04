#VPC ID
data "aws_vpc" "vpc" {
  id = var.WPvpcid
}

#Subnet ID
data "aws_subnet" "public-subnet-a" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:aws:cloudformation:logical-id"
    values = [var.WPcf_public_a_subnet]
  }
}

#Security Group
data "aws_security_group" "WP_security_Group" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name   = "tag:Name"
    values = [var.WPvpc_security_group_ids]
  }
}