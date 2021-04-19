module "aws_security_group"{
    source      = "./security-groups"
    name        = "acesso-ssh"
    description  = "Security Group que permite o acesso ssh a maquina"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
   #cdirs_acesso_remoto = Default
    tag_name    = "ssh"
}

module "aws_instance"{
    source                  = "./instances"
    instance_type           = "t2.micro"
    amis                    = "ami-013f17f36f8b1fefb"
    tags_name               = "dev-bucket"  
    vpc_security_group_ids  = ["sg-04ab58c76f5d5bc9d"] 
    dependencie             = [module.bucket.bucket-name]
}

module "bucket"{
    source      = "./bucket"
    bucket      = "bucketvictor-teste"
    acl         = "private"
    tags_name   = "bucketvictor-teste"
}

output "teste"{
    value = module.bucket.bucket-name
}