# Resource Definiation for the VM Template
source "proxmox-iso" "ubuntu-server-noble" {
 
    # Proxmox Connection Settings
    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    # (Optional) Skip TLS Verification
    # insecure_skip_tls_verify = true
    
    # VM General Settings
    node = "proxmox"
    vm_id = "500"
    vm_name = "ubuntu-server-noble"
    template_description = "Ubuntu Server Noble Image"

    # VM OS Settings
    # (Option 1) Local ISO File
    iso_file = "local:iso/ubuntu-24.04.1-live-server-amd64.iso"
    # - or -
    # (Option 2) Download ISO
    # iso_url = "https://releases.ubuntu.com/24.04/ubuntu-24.04-live-server-amd64.iso"
    # iso_checksum = "8762f7e74e4d64d72fceb5f70682e6b069932deedb4949c6975d0f0fe0a91be3"
    iso_storage_pool = "local"
    unmount_iso = true

    # VM System Settings
    qemu_agent = true

    # VM Hard Disk Settings
    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "20G"
        format = "raw"
        storage_pool = "samsung"
        storage_pool_type = "lvm"
        type = "virtio"
    }

    # VM CPU Settings
    cores = "2"
    
    # VM Memory Settings
    memory = "2048" 

    # VM Network Settings
    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        firewall = "false"
    } 

    # VM Cloud-Init Settings
    cloud_init = true
    cloud_init_storage_pool = "local-lvm"

    # PACKER Boot Commands
    boot_command = [
        "<esc><wait>",
        "e<wait>",
        "<down><down><down><end>",
        "<bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
    ]

    boot                    = "c"
    boot_wait               = "10s"
    communicator            = "ssh"

    # PACKER Autoinstall Settings
    http_directory          = "http" 
    # (Optional) Bind IP Address and Port
    # http_bind_address       = "0.0.0.0"
    # http_port_min           = 8802
    # http_port_max           = 8802

    ssh_username            = "${var.ssh_username}"

    # (Option 1) Add your Password here
    # ssh_password        = "${var.ssh_username}"
    # - or -
    # (Option 2) Add your Private SSH KEY file here
    ssh_private_key_file    = "~/.ssh/home-lab"

    # Raise the timeout, when installation takes longer
    ssh_timeout             = "13m"
    ssh_pty                 = true
}
