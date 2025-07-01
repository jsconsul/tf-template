resource "google_storage_bucket_object" "src_webhook_handler_zip" {
  source       = data.archive_file.src_webhook_handler.output_path
  content_type = "application/zip"
  name         = "src-${data.archive_file.src_webhook_handler.output_md5}.zip"
  bucket       = var.gcs_bucket
  depends_on = [
    data.archive_file.src_webhook_handler
  ]
}
