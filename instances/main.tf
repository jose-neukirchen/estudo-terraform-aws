#Definindo o Recurso: aws_instance -> provê uma instância EC2 (permite ciração, update e delete)
resource "aws_instance" "dev"{
  count = 3
  ami = var.amis   
  instance_type = var.instance_type
  key_name = var.key_name       
  tags = {
      Name = "dev${count.index}"  
  }  
  vpc_security_group_ids = ["sg-04ab58c76f5d5bc9d"]
   
}

resource "aws_instance" "dev_and_bucket"{
  ami                     = var.amis   
  instance_type           = var.instance_type
  key_name                = var.key_name       
  tags = {
      Name                = var.tags_name
  }  
  vpc_security_group_ids  = var.vpc_security_group_ids
  /* depends_on              = [aws_s3_bucket.dev4] */
} 