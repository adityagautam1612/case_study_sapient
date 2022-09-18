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

# variables for auto scaler
variable "asg_config" {
  type = map(any)
  default = {
    region                      = "us-west1"
    zone                        = "us-west1-b"
    target-pool-name            = "agautam-target-pool"
    autoscaler                  = "agauatm-autoscaler"
    max_replicas                = 5
    min_replicas                = 1
    cooldown_period             = 60
    target                      = 0.5
    instance_group_manager_name = "agauatm-igm"
    instance_template_name      = "agauatm-instance-template"
    machine_type                = "e2-micro"
    source_image                = "centos-cloud/centos-7"
    base_instance_name          = "agauatm-base-instance"
    firewall_name               = "webserver"
    network_tags                = "webserver"
    static_name                 = "ipv4-address"
  }
}

# variables for forwaring rule
variable "lb_config" {
  type = map(any)
  default = {
    loadbalancer     = "agauatm-global-lb"
    target_proxy     = "glb-target-proxy"
    url_map          = "url-map-target-proxy"
    port_range       = "80"
    backend          = "backend"
    port_name        = "http"
    health_check     = "check-backend"
  }
}
