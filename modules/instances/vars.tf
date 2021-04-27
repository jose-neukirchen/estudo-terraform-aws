variable "amis" {
  description = "Imagem a ser utilizada na máquina"
  type        = string  
  default     = "ami-013f17f36f8b1fefb" 
  }

variable "key_name"{
  description = "Chave a ser utilizada"
  default = "terraform-aws"
}

variable "instance_type"{
  description = "Categoria de máquina escolhida"
  type    = string
}

variable "tags_name"{
  description = "Tags a serem utilizadas na máquina"
  type    = string
}

variable "vpc_security_group_ids"{
  description = "ID do security group"
  type = list 
}

variable "dependencie"{
  description = "Recursos que inferem dependência"
  type = list
  default = null
}

variable "number_of_instances"{
  description = "Número de réplicas a serem subidas"
  type = number
  default = 1
}
