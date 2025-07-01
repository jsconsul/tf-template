module "base" {
    source = "../modules/default"  # Relative path to the module directory
    project_id = var.project_id
    zones = var.zones  # Add the required "zones" attribute here
    gcs_bucket = var.gcs_bucket  # Add the required "gcs_bucket" attribute here
    storage_bucket = var.storage_bucket
    region = var.region  # Add the required "region" attribute here
    service_account_email = var.service_account_email
}
