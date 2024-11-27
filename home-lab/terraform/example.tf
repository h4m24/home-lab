resource "proxmox_vm_qemu" "cloudinit-example" {
  vmid             = 100
  name             = "test-terraform0"
  target_node      = "proxmox"
  agent            = 1
  cores            = 4
  memory           = 2024
  boot             = "order=scsi0"  # has to be the same as the OS disk of the template
  clone            = "ubuntu-24.04" # The name of the template
  scsihw           = "virtio-scsi-single"
  vm_state         = "running"
  automatic_reboot = true

  # Cloud-Init configuration
  # cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  ciupgrade  = true
  nameserver = "10.10.10.30"
  ipconfig0  = "ip=dhcp"
  skip_ipv6  = true
  ciuser     = "hamza"
  cipassword = "slackware"
  sshkeys    = file("/Users/hamza/.ssh/home-lab.pub")

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
    bridge = "vmbr0"
    model  = "virtio"
  }
}

