variable "name"{
  description = "Nome da tabela"
  type = string 
}

variable "billing_mode"{
  description = "Tipo de cobrança - Controla como vc será cobrado de acordo com o uso"
  type = string
}

variable "hash_key"{
  description = "Atributo para usar como hash (partition) key"
  type    = string
}

variable "range_key"{
  description = "Atributo para passar como range (sort) key"
  type = string
  default = null
}


variable "attribute_type"{
  description = "Tipo do atributo"
  type    = string
}

