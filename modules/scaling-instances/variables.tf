variable "alc_name_prefix" {
    description = "The prefix name of the aws_launch_config"
    type = string
}

variable "alc_image_id" {
    description = "The image id of the aws_launch_config"
    type = string
    default = "ami-013f17f36f8b1fefb"
}

variable "alc_instance_type" {
    description = "The instance type of the aws_launch_config"
    type = string
    default = "t2.micro"
}

variable "asg_name" {
    description = "The name of the Autoscaling group"
    type = string
}

variable "min_size" {
    description = "The minimal size of instances in the autoscaling group"
    type = number
    default = 1
}

variable "max_size" {
    description = "The maximal size of instances in the autoscaling group"
    type = number
}

variable "security_groups"{
  description = "IDs dos security groups"
  type = list 
}