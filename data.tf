data "terraform_remote_state" "app" {
  backend = "s3"
  config = {
    bucket = "tech-challenge-tf-state-bucket"
    key    = "app/terraform.tfstate"
    region = "us-west-2"
  }
}