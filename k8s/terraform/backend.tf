terraform {
  backend "gcs" {
    bucket = "opa-terraform"
    prefix = "terraform.tfstate"
  }
}