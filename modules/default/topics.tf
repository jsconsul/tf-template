resource "google_pubsub_topic" "webhook_data" {
  name                        = "webhook-data"
  message_retention_duration  = "604800s"
  project                     = var.project_id
}
