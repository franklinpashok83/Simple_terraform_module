# variable "ec2"
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "default"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "name" {
  description = "instance name"
  type        = string
  default     = "MSD-wordpress-server"
}

variable "env" {
  description = "Environment"
  type        =  string
  default     = "default"
}

variable "cost_center" {
  description = "cost_center"
  type        = string
  default     = "default"
}

variable "owner" {
  description = "owner"
  type        = string
  default     = "default"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "default"
}

variable "ec2count" {
  description = "Number of ec2 servers to deploy"
  type        = number
  default     = "1"
}

variable "ami_id" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "assign instance type"
  default     = "true"
}

variable "WPcf_public_a_subnet" {
  description = "public-subnet"
  default     = "default"
  type        = string
}

variable "WPvpcid" {
  description = "VPC id"
  default     = "default"
  type        = string
}

variable "WPvpc_security_group_ids" {
  description = "Security group ID"
  default     = null
  type = string
}

variable "WPmonitoring" {
  description = "monitoring the ec2 instance"
  default     = "true"
  type        = bool
}

variable "WPpublicip" {
  description = "assign public IP for the instance"
  default     = "true"
  type        = bool
}

variable "key_name" {
  description = "key-pair for ec2 access"
  default     = null
  type        = string
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

# variable "ebs"

variable "size" {
  description = "size of the ebs volume"
  type        = number
  default     = "10"
}

variable "encrypted" {
  description = "If the ebs volume is encrypted"
  type        = bool
  default     = "true"
}

variable "type" {
  description = "EBS volume type"
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "volume tags"
  type        = map(string)
  default     = {}
}

variable "ebscount" {
  description = "volume count"
  type        = number
  default     = "1"
}

