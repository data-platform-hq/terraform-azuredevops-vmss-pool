output "vmss_id" {
  value       = module.vmss.id
  description = "VM Scale Sets id"
}

output "public_ip_prefix" {
  value       = module.vmss.public_ips
  description = "Public IP Address Prefix CIDR"
}
