resource "proxmox_vm_qemu" "vm_from_template" {
  name        = "terraform-vm"
  target_node = "proxmox"
  clone       = "ubuntu-server-noble" # ID of the template VM to clone
  full_clone  = true                  # Set to false if you prefer a linked clone

  # VM Hardware Configurations
  cores   = 2
  sockets = 1
  memory  = 2048
  scsihw  = "virtio-scsi-pci"
  boot    = "order=virtio0" # Specify the boot order to ensure the VM boots from the correct disk
  bios    = "seabios"       # Use SeaBIOS for compatibility

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    slot    = "virtio0" # Ensure slot is a valid option
    size    = "20G"     # Ensure disk is large enough for the VM to boot properly
    storage = "local-lvm"
    type    = "disk"
    backup  = true
  }

}
