data "archive_file" "src_webhook_handler" {
  type        = "zip"
  source_dir  = "${path.module}/../src/webhook_handler"
  output_path = "${path.module}/../src/webhook_handler.zip"
}

