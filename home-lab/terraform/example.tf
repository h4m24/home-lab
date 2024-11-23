module "vm_from_template" {
  source = "./modules/vm"

  name           = "terraform-vm"
  cores          = 4
  memory         = 2048
  sockets        = 1
  disk_size      = "20G"
  vm_id          = 100
}
