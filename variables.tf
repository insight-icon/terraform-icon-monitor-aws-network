
########
# Label
########
variable "name" {
  description = "The name for the label"
  type        = string
  default     = "monitoring"
}

variable "tags" {
  description = "Tgas to apply to instance"
  type        = map(string)
  default     = {}
}

variable "id" {
  description = "The id to apply to resources"
  type        = string
  default     = ""
}

variable "public_ports" {
  description = "List of ports to open publicly"
  type        = list(string)
  default     = [3000, 9093, 9091, 9090]
}

