variable "name" {
  type        = string
}

variable "description" {
  type        = string
}

variable "from_port" {
  type        = number
}

variable "to_port" {
  type        = number
}

variable "protocol" {
  type        = string
}

variable "cdirs_acesso_remoto" {
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "tag_name" {
  type        = string
}