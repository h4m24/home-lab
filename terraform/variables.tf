variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type = string
}

variable "pihole_api_token_secret" {
  type = string
}

variable "cloud_init_meta_source" {
  default = "meta.yaml"
  type    = string
}

variable "cloud_init_network_source" {
  default = "network.yaml"
  type    = string
}