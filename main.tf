provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

}
module "my_vpc" {
    source = "../modules/vpc"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
#the below vpc ID is coming from the module output
    vpc_id = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source = "../modules/ec2"
  ec2_count = 1
  instance_type = "t2.micro"
#the below subnet ID is coming from the module output
  subnet_id = "${module.my_vpc.subnet_id}"
  ami_id = "ami-04fc979a55e14b094"
}