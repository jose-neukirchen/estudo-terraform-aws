resource "aws_dynamodb_table" "dynamodb-teste-victor" {
  name           = var.name
  billing_mode   = var.billing_mode
  hash_key       = var.hash_key
  range_key      = var.range_key

  attribute {               #(Required) List of nested attribute definitions. 
                            #Only required for hash_key and range_key attributes. Must have name & type.
    name = var.hash_key
    type = var.attribute_type
  }

  attribute {
    name = var.range_key
    type = var.attribute_type
  }
}