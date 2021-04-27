variable "name" {
  description = "Nome do recurso"
  type        = string  
  default     = null
  }

variable "azs"{
  description = "Lista de Availability zones"
  type = list
  default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}

variable "access_logs"{
  description = "Configura o bucket para onde serão destinados os logs de acesso"
  type    = list(map(string))
}

variable "listener"{
  description = "Configuras as portas de comunicação nas instâncias e no LB"
  type    = list(map(string))
}

variable "health_check"{
  description = "Configura as avaliações de saúde do ELB"
  type = list(map(string))
}

variable "instances"{
  description = "Lista de instâncias alvo do LB"
  type = list
}

variable "cross_zone_load_balancing"{
  description = "Permite balanceamento de carga entre zonas"
  type = bool
  default = true
}

variable "idle_timeout"{
  description = "Tempo permitido de conexão ociosa"
  type = number
  default = 400
}

variable "connection_draining"{
  description = "Permite drenagem de conexão"
  type = bool
  default = true
}

variable "connection_draining_timeout"{
  description = "Tempo necessário para que uma conexão seja drenada"
  type = number
  default = 400
}

/* variable "tags"{
  description = "atribuição de tags"
  type = list(map(string))
} */