variable "region" {
  description = "GCP region identifier"
  type        = string
}

variable "zones" {
  description = "GCP zone identifier"
  type        = list(any)
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "gcs_bucket" {
  description = "Name of the GCS bucket storing cloud functions"
  type        = string
}

variable "storage_bucket" {
  description = "Name of the GCS bucket storing audio"
  type        = string
}

variable "service_account_email" {
  description = "service account email for cloud functions"
  type        = string
}
