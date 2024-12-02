resource "proxmox_vm_qemu" "machine" {
  vmid        = var.vmid
  name        = var.name
  target_node = var.target_node
  cores       = var.cores
  memory      = var.memory
  nameserver  = var.nameserver
  ipconfig0   = var.ipconfig0
  vm_state    = var.vm_state
  ciuser      = var.ciuser
  cipassword  = var.cipassword
  sshkeys     = var.sshkeys
  # Cloud-Init configuration
  cicustom    = "user=local:snippets/cloud-config-user-${random_id.cloud_init_id.hex}.yaml"

  clone            = "ubuntu-24.04" # The name of the template
  scsihw           = "virtio-scsi-single"
  automatic_reboot = true

  # ciupgrade = true
  skip_ipv6 = true
  boot      = "order=scsi0" # has to be the same as the OS disk of the template

  # https://github.com/Telmate/terraform-provider-proxmox/issues/922#issuecomment-1923899040
  agent = 0

  # Most cloud-init images require a serial device for their display
  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "samsung"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size = "30G"
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide2 {
        cloudinit {
          storage = "samsung"
        }
      }
    }
  }

  network {
    bridge = "vmbr1"
    model  = "virtio"
  }
}

