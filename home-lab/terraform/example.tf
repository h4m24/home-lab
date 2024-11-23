# # Proxmox Full-Clone
# # ---
# # Create a new VM from a clone

# resource "proxmox_vm_qemu" "test-vm" {

#   # VM General Settings
#   target_node = "proxmox"
#   vmid        = "100"
#   name        = "test-vm"
#   desc        = "Description"
#   os_type     = "Linux 5.x - 2.6 Kernel"
#   # VM Advanced General Settings
#   onboot = true

#   # VM OS Settings
#   clone      = "ubuntu-server-noble"
#   full_clone = true

#   # VM System Settings
#   agent = 1


#   scsihw = "virtio-scsi-pci"


#   # VM Hard Disk Settings
#   boot     = "order=virtio;net0"
#   hotplug  = "disk,network,usb"

#   disks {
#     scsi {
#       scsi0 {
#         disk {
#           backup             = true
#           cache              = "none"
#           discard            = true
#           emulatessd         = true
#           iothread           = true
#           mbps_r_burst       = 0.0
#           mbps_r_concurrent  = 0.0
#           mbps_wr_burst      = 0.0
#           mbps_wr_concurrent = 0.0
#           replicate          = true
#           size               = 32
#           storage            = "samsung"
#         }
#       }
#     }
#   }


#   # VM CPU Settings
#   cores   = 4
#   sockets = 1
#   cpu     = "host"

#   # VM Memory Settings
#   memory = 2048

#   # VM Network Settings
#   network {
#     bridge = "vmbr0"
#     model  = "virtio"
#   }

#   lifecycle {
#     prevent_destroy = false
#   }





#   # VM Cloud-Init Settings



#   # (Optional) IP Address and Gateway
#   # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"

#   # (Optional) Default User
#   # ciuser = "your-username"

#   # (Optional) Add your SSH KEY
#   # sshkeys = <<EOF
#   # #YOUR-PUBLIC-SSH-KEY
#   # EOF
# }
# resource "proxmox_vm_qemu" "vm_from_template" {
#   name        = "terraform-vm"
#   target_node = "proxmox"
#   clone       = "ubuntu-server-noble" # ID of the template VM to clone
#   full_clone  = true  # Set to false if you prefer a linked clone

#   # VM Hardware Configurations
#   cores       = 2
#   sockets     = 1
#   memory      = 2048
#   scsihw      = "virtio-scsi-pci"
#   boot        = "order=scsi0" # Specify the boot order to ensure the VM boots from the correct disk
#   bios        = "seabios"      # Use SeaBIOS for compatibility

#   network {
#     model    = "virtio"
#     bridge   = "vmbr0"
#   }
  
#   disk {
#     slot       = 0
#     size       = "20G"  # Ensure disk is large enough for the VM to boot properly
#     storage    = "local-lvm"
#     type       = "disk"
#     backup     = true
#   }

# }
