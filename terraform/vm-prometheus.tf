locals {
  user_data_prometheus = templatefile("${path.module}/user.yaml", {
    hostname              = "prometheus"
    ansible_playbook_file = "prometheus.yml"
  })
  user_data_file_prometheus = "/tmp/generated_user_data_prometheus.yaml"
}

resource "local_file" "user_data_prometheus" {
  content  = local.user_data_prometheus
  filename = local.user_data_file_prometheus
}


resource "pihole_dns_record" "prometheus_record" {
  domain = "prometheus.blue-finch.org"
  ip     = "10.10.20.60"
}


module "vm_prometheus" {
  source = "./modules/VM"
  # frequently changed variables
  vmid      = 161
  name      = "prometheus"
  cores     = 4
  memory    = 2048
  ipconfig0 = "ip=10.10.20.60/24,gw=10.10.20.1"

  vm_state    = "running"
  nameserver  = "10.10.10.30"
  cipassword  = "slackware"
  ciuser      = "hamza"
  sshkeys     = file("/Users/hamza/.ssh/home-lab.pub")
  target_node = "proxmox"

  cloud_init_user_source = local.user_data_file_prometheus

  proxmox_host_ip = "10.10.10.20"
  ssh_user        = "root"
  ssh_private_key = "~/.ssh/home-lab"

}
