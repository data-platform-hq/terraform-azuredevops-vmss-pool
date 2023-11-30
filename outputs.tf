output "vmss_id" {
  value       = module.vmss.id
  description = "VM Scale Sets id"
}

output "public_ip_prefix" {
  value       = module.vmss.public_ips
  description = "Public IP Address Prefix CIDR"
}

output "tls_key" {
  value = {
    public_key  = tls_private_key.this.public_key_openssh
    private_key = tls_private_key.this.private_key_openssh
  }
  description = "SSH Key for VMSS authorization"
}
