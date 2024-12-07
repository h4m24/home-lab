variable "pihole_api_token_secret" {
  description = "API token for Pi-hole"
  type        = string
  sensitive   = true
}

variable "cloud_init_meta_source" {
  default = "meta.yaml"
  type    = string
}

variable "cloud_init_network_source" {
  default = "network.yaml"
  type    = string
}