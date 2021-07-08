output "ipv4_address" {
  value = "${vultr_instance_ipv4.minecraft_ipv4.ip}"
  description = "The server's IP address"
}