terraform {
  backend "s3" {
    bucket = "terraformremotestatefranklin"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    profile = "personal"
    encrypt = true
  }
}