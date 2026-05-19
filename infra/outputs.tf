output "public_ip" {
  value       = azurerm_linux_virtual_machine.web_server.public_ip_address
  description = "Public IP profile of the Cloud Azure VM"
}
