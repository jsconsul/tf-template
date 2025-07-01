resource "google_cloudfunctions2_function" "fetch_data" {
  # TODO: change cloud function name to webhook-handler
  name        = "fetch-data"
  project     = var.project_id
  location    = var.region
  description = "Receives webhook events"

  build_config {
    runtime     = "python312"
    entry_point = "main" # Set the entry point 
    source {
      storage_source {
        bucket = var.gcs_bucket
        object = google_storage_bucket_object.src_webhook_handler_zip.name
      }
    }
  }

  service_config {
    max_instance_count = 1
    min_instance_count = 1
    available_memory   = "512M"
    timeout_seconds    = 60
    environment_variables = {
      GOOGLE_CLOUD_PROJECT = var.project_id
      REGION = var.region
      STAGE_PROJECT_ID = "staging"
      PROD_PROJECT_ID = "prod"
      LOG_LEVEL = "DEBUG"
    }
    secret_environment_variables {
      key        = "CREDENTIALS"
      project_id = var.project_id
      secret     = "credentials"
      version    = "latest"
    }
    service_account_email = var.service_account_email
  }
}

