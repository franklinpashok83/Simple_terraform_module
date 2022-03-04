terraform {
  backend "s3" {
    bucket = "wordpressdemomybucket"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    profile = "default"
    encrypt = true
  }
}