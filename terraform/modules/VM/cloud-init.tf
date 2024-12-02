resource "null_resource" "cloud_init_config" {
  provisioner "file" {
    source      = var.cloud_init_user_source
    destination = "/var/lib/vz/snippets/cloud-config-user-${random_id.cloud_init_id.hex}.yaml"
    connection {
      type = "ssh"
      user = var.ssh_user
      host = var.proxmox_host_ip
      private_key = file(var.ssh_private_key)
    }
  }

  triggers = {
    proxmox_host_ip = var.proxmox_host_ip
  }
}

resource "random_id" "cloud_init_id" {
  byte_length = 8
}