variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Target cloud deployment region"
}

variable "instance_name" {
  type        = string
  default     = "polyglot-app-server"
  description = "Name tag for our virtual machine"
}