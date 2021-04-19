variable "amis" {
  type        = string   #Tipo da variável
  default     = "ami-013f17f36f8b1fefb" #declaração da variável 2
  }

variable "key_name"{
  default = "terraform-aws"
}

variable "instance_type"{
  type    = string
}

variable "tags_name"{
  type    = string
}

variable "vpc_security_group_ids"{
  type = list 
}

variable "dependencie"{
  type = list
  default = null
}

