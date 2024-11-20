# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "test-vm" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "100"
    name = "test-vm"
    desc = "Description"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-noble"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 4
    sockets = 4
    cpu = "host"    
    
    # VM Memory Settings
    memory = 2048

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}