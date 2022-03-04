provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

locals  {
    WPpublic_subnet_a = data.aws_subnet.public-subnet-a.id
    WP_Security_group = [data.aws_security_group.WP_security_Group.id]
    availability_zone = var.availability_zone
}

module "mymsdec2" {
  source                 = "../modules/ec2"
  ec2count               = var.ec2count
  #for_each               = var.name
  instance_type          = var.instance_type
  public_subnetid        = local.WPpublic_subnet_a
  vpc_security_group_ids = local.WP_Security_group
  ami_id                 = var.ami_id
  monitoring             = var.WPmonitoring
  publicip               = var.WPpublicip
  key_name               = var.key_name
  availability_zone      = var.availability_zone
  tags = {
    "Name"        = var.name
    "env"         = var.env
    "cost-center" = var.cost_center
    "owner"       = var.owner
    "project"     = var.project
    }
}

resource "aws_volume_attachment" "ebs-att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.EBS-MSD-Volume.id
  instance_id = module.mymsdec2.id
}

resource "aws_ebs_volume" "EBS-MSD-Volume" {
  availability_zone      = local.availability_zone
  size                   = var.size
  encrypted              = var.encrypted
  type                   = var.type
}


# module "msd-asg" {
#   source                    = "../modules/asg"
#   name                      = var.asgname
#   instance_type             = var.instance_type
#   min_size                  = var.asg_min_size
#   max_size                  = var.asg_max_size
#   desired_capacity          = var.asg_desired_capacity
#   wait_for_capacity_timeout = var.wait_capacity_timeout
#   health_check_type         = var.health_check_type
#   vpc_zone_identifier       = var.app_subnets
#   target_group_arns         = var.target_group_arns
#   enabled_metrics           = var.enabled_metrics
#}