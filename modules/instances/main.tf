#Definindo o Recurso: aws_instance -> provê uma instância EC2 (permite ciração, update e delete)
resource "aws_instance" "dev"{
  /* count = var.number_of_instances */
  ami = var.amis   
  instance_type = var.instance_type
  key_name = var.key_name       
  tags = {
      Name = var.tags_name 
  }  
  vpc_security_group_ids = var.vpc_security_group_ids
  depends_on = [var.dependencie]
}
