output "server_address" {
  value       = vultr_instance.minecraft.main_ip
  description = "The server's IP address"
}

output "private_ssh_key" {
  value       = tls_private_key.generated.private_key_pem
  description = "Private key for the server"
  sensitive   = true
}