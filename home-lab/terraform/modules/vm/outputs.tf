
output "vm_id" {
  description = "The ID of the created VM"
  value       = proxmox_vm_qemu.vm_from_template.id
}

output "vm_name" {
  description = "The name of the created VM"
  value       = proxmox_vm_qemu.vm_from_template.name
}