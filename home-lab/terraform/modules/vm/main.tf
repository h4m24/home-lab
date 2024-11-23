terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

resource "proxmox_vm_qemu" "vm_from_template" {
  name        = var.name
  target_node = var.target_node
  clone       = var.clone
  full_clone  = var.full_clone
  vmid        = var.vm_id

  # VM Hardware Configurations
  cores   = var.cores
  sockets = var.sockets
  memory  = var.memory
  scsihw  = var.scsihw
  boot    = var.boot
  bios    = var.bios

  network {
    model  = var.network_model
    bridge = var.network_bridge
  }

  disk {
    slot    = var.disk_slot
    size    = var.disk_size
    storage = var.disk_storage
    type    = var.disk_type
    backup  = var.disk_backup
  }
}