
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