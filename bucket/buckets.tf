#criando um bucket
resource "aws_s3_bucket" "dev4" {
  bucket =   var.bucket
  acl    =   var.acl
  tags = {
    Name  = var.tags_name  
  }
}
