locals {
  user_data_home-assistant = templatefile("${path.module}/user.yaml", {
    hostname              = "home-assistant"
    ansible_playbook_file = "home-assistant.yml"
  })
  user_data_file_home-assistant = "/tmp/generated_user_data_home-assistant.yaml"
}

resource "local_file" "user_data_home-assistant" {
  content  = local.user_data_home-assistant
  filename = local.user_data_file_home-assistant
}


resource "pihole_dns_record" "home-assistant_record" {
  domain = "home-assistant.blue-finch.org"
  ip     = "10.10.20.60"
}


module "vm_home-assistant" {
  source = "./modules/VM"
  # frequently changed variables
  vmid      = 161
  name      = "home-assistant"
  cores     = 4
  memory    = 2048
  ipconfig0 = "ip=10.10.20.60/24,gw=10.10.20.1"

  vm_state    = "running"
  nameserver  = "10.10.10.30"
  cipassword  = "slackware"
  ciuser      = "hamza"
  sshkeys     = file("/Users/hamza/.ssh/home-lab.pub")
  target_node = "proxmox"

  cloud_init_user_source = local.user_data_file_home-assistant

  proxmox_host_ip = "10.10.10.20"
  ssh_user        = "root"
  ssh_private_key = "~/.ssh/home-lab"

}
