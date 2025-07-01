terraform {
  backend "gcs" {
    bucket  = "cloud-function-prod"
    prefix  = "terraform/state"
  }
}