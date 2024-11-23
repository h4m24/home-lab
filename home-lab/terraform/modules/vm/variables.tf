variable "name" {
  description = "Name of the VM"
  type        = string
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
  default     = "proxmox"
}

variable "clone" {
  description = "ID of the template VM to clone"
  type        = string
  default     = "ubuntu-server-noble"
}

variable "full_clone" {
  description = "Whether to perform a full clone"
  type        = bool
  default     = true
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "sockets" {
  description = "Number of CPU sockets"
  type        = number
}

variable "memory" {
  description = "Amount of memory in MB"
  type        = number
}

variable "scsihw" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "boot" {
  description = "Boot order"
  type        = string
  default     = "order=virtio0"
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "seabios"
}

variable "network_model" {
  description = "Network model"
  type        = string
  default     = "virtio"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "disk_slot" {
  description = "Disk slot"
  type        = string
  default     = "virtio0"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
}

variable "disk_storage" {
  description = "Disk storage"
  type        = string
  default     = "local-lvm"
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "disk"
}

variable "disk_backup" {
  description = "Whether to backup the disk"
  type        = bool
  default     = true
}

variable "vm_id" {
  description = "ID of the VM"
  type        = number
}