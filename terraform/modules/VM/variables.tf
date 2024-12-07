# variable "proxmox_api_url" {
#   type = string
# }

# variable "proxmox_api_token_id" {
#   type = string
# }

# variable "proxmox_api_token_secret" {
#   type = string
# }

variable "vmid" {
  type = number
}

variable "name" {
  type = string
}

variable "target_node" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "nameserver" {
  type = string
}

variable "ipconfig0" {
  type = string
}

variable "ciuser" {
  type = string
}

variable "cipassword" {
  type = string
}

variable "sshkeys" {
  type = string
}

variable "vm_state" {
  type = string
}

variable "proxmox_host_ip" {
  type = string
}

variable "ssh_user" {
  type = string
  default = "root"
}

variable "ssh_private_key" {
  type = string
  default = "~/.ssh/id_rsa"
}

variable "cloud_init_user_source" {
  type = string
}
