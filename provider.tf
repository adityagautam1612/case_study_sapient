provider "google" {
 credentials = file(var.credentials)
 project     = var.gcp_project
 region      = var.region
}

provider "google-beta" {
 credentials = file(var.credentials)
 project     = var.gcp_project
 region      = var.region
}


#resource "google_compute_project_metadata_item" "ssh-keys" {
#  project     = var.gcp_project
#  key         = "ssh-keys"
#  value       = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
#}
