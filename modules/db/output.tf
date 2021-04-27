#Output para ser utilizado de refrência para outros módulos
output "db-name"{
  value = aws_dynamodb_table.dynamodb-teste-victor.id
}