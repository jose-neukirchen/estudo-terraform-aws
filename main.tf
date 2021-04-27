#The resource random_pet generates random names that are intended to be used as unique identifiers
resource "random_pet" "this" {
  length = 2
}

#Service Account
data "aws_elb_service_account" "this" {}


#IAM Policy for ELB access logs
data "aws_iam_policy_document" "logs" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.this.arn]
    }

    resources = [
      "arn:aws:s3:::elb-logs-${random_pet.this.id}/*",
    ]
  }
}

#Creates a security group that enables ssh access 
module "aws_security_group"{
    source      = "./modules/security-groups"
    name        = "acesso-ssh"
    description = "Security Group que permite o acesso ssh a maquina"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
   #cdirs_acesso_remoto = Default
    tag_name    = "ssh"
}

#EC2 instance
module "aws_instance1"{
    source                  = "./modules/instances"
    instance_type           = "t2.micro"
    amis                    = "ami-013f17f36f8b1fefb"
    tags_name               = "dev-with-lb"  
    vpc_security_group_ids  = [module.aws_security_group.security_group_id]
    number_of_instances     = 3
}

#EC2 instance depedent of a bucket
module "aws_instance2"{
    source                  = "./modules/instances"
    instance_type           = "t2.micro"
    amis                    = "ami-013f17f36f8b1fefb"
    tags_name               = "dev-bucket"  
    vpc_security_group_ids  = [module.aws_security_group.security_group_id]
    dependencie             = [module.bucket.bucket-name]
}

#EC2 instance depedent of a dynamodb table
module "aws_instance_dev_and_db"{
    source                  = "./modules/instances"
    instance_type           = "t2.micro"
    amis                    = "ami-013f17f36f8b1fefb"
    tags_name               = "dev-db"  
    vpc_security_group_ids  = [module.aws_security_group.security_group_id] 
    dependencie             = [module.aws_dynamodb_table.db-name]
}

#S3 Bucket
module "bucket"{
    source      = "./modules/bucket"
    bucket      = "bucketvictor-teste"
    acl         = "private"
    tags_name   = "bucketvictor-teste"
}

#Dynamo DB table
module "aws_dynamodb_table"{
    source                  = "./modules/db"
    name                    = "Base_de_dados_teste"
    billing_mode            = "PAY_PER_REQUEST"
    hash_key                = "Victor"
    range_key               = "Teste"
    attribute_type          = "S"
}

#Access logs bucket for ELB
module "my-elb-access-logs-bucket"{
    source      = "./modules/bucket"
    bucket      = "elb-logs-${random_pet.this.id}"
    acl         = "log-delivery-write"
    tags_name   = "my-elb-access-logs-bucket"
    policy      = data.aws_iam_policy_document.logs.json
    force_destroy = true 
}

#Cretaes an ELB 
module "aws_elastic_load_balancer"{
    source = "./modules/elb"
    name = "Elb-teste"
    access_logs = [{
        bucket        = "elb-logs-${random_pet.this.id}"
        bucket_prefix = "elb"  
        interval      = 60
    }]
    listener = [{
        instance_port     = 8000
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }]
    health_check = [{
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "HTTP:8000/"
        interval            = 30
    }]
    instances               = [
        module.aws_instance1.instance_id,
        module.aws_instance2.instance_id, 
        module.aws_instance_dev_and_db.instance_id
        ]
/*     tags = [{
        name = "elb-teste"
     }] */
}


#Creates an autoscaling group
module "Autoscaling"{
  source          = "./modules/scaling-instances"
  alc_name_prefix = "scaling-instance"
  alc_instance_type   = "t2.micro"
  security_groups =  [module.aws_security_group.security_group_id]
  asg_name        = "autoscaling-group"
  min_size        = 1
  max_size        = 10 
}