data "archive_file" "src_bridge" {
  type        = "zip"
  source_dir  = "${path.module}/../../src/bridge"
  output_path = "${path.module}/../../src/bridge.zip"
}
