variable "name" {
  description = "Nome do security group"
  type        = string
}

variable "description" {
  description = "Descrição do security group"
  type        = string
}

variable "from_port" {
  description = "Porta de Origem"
  type        = number
}

variable "to_port" {
  description = "Porta de destino"
  type        = number
}

variable "protocol" {
  description = "Protocolo a ser utilizado - UDP, TCP"
  type        = string
}

variable "cdirs_acesso_remoto" {
  description = "CIDR block a ser utilizado"
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "tag_name" {
  description = "Atribuição de tags"
  type        = string
}