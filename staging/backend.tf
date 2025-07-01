terraform {
  backend "gcs" {
    bucket  = "cloud-function-staging"
    prefix  = "terraform/state"
  }
}