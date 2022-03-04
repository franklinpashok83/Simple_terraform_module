aws_region = "ap-southeast-1"
aws_profile = "default"

#for ec2 instance
ec2count = 1
ami_id = "ami-04fc979a55e14b094"
WPvpcid = "vpc-0838d2a8456b987e4"
WPcf_public_a_subnet  = "publicSubnetA"
WPvpc_security_group_ids = "Wordpresssecuritygroup"
instance_type = "t3.micro"
name = "MSD-Wordpress"
env = "dev"
cost_center = "test"
owner = "MSD-team"
project = "MSD"
key_name = "msd-keypair"
availability_zone = "ap-southeast-1a"

#for ebs volume
ebscount = "1"
size = "10"