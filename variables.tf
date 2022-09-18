variable "region" {
    default = "us-west1"
}

variable "gcp_project" {
    default = "internal-interview-candidates"
}

variable "credentials" {
    default = "sa.json"
}

variable "project_name" {
    default = "agautam"
}

variable "subnet_cidr" {
    default = "10.10.0.0/24"
}

variable "scopes_default_web" {
  default = [
    "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/compute.readonly",
  ]
}
