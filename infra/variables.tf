variable "location" {
  type        = string
  default     = "West Europe"
  description = "Azure region to deploy resources"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1ms"
  description = "Free Tier eligible VM size (1 vCPU, 1GB RAM)"
}
