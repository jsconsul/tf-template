resource "google_cloudfunctions2_function" "bridge" {
  name        = "bridge"
  project     = var.project_id
  location    = var.region
  description = "Receieves webhook events via HTTP and publishes to Pub/Sub"

  build_config {
    runtime     = "python312"
    entry_point = "main" # Set the entry point 
    source {
      storage_source {
        bucket = var.gcs_bucket
        object = google_storage_bucket_object.src_bridge_zip.name
      }
    }
  }

  service_config {
    min_instance_count = 1
    max_instance_count = 2
    available_memory   = "512M"
    timeout_seconds    = 120
    environment_variables = {
      GOOGLE_CLOUD_PROJECT = var.project_id
      TOPIC_PATH = google_pubsub_topic.webhook_data.id
      REGION = var.region
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
