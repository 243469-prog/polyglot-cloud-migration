output "server_public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "The public IP address of our deployed application host cloud server"
}