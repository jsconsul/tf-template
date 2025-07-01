terraform {
  backend "gcs" {
    bucket  = "cloud-function"
    prefix  = "terraform/state"
  }
}
