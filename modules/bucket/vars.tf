variable "bucket"{
  description = "Nome do bucket, se não designado, aws atribui um nome aleatório"
  type    = string
  default = null
}

variable "acl"{
  description = "Tipo de Access Control List - define o tipo de acesso permitido ao bucket"
  type    = string
}

variable "tags_name"{
  description = "Nome da tag atribuída ao bucket"
  type    = string
}

variable "policy"{
  default = null
}
variable "force_destroy"{
  type = bool
  default = true
}