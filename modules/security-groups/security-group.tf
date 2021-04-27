#Definindo rescurso de security group para permitir acesso ssh às máquinas
resource "aws_security_group" "acesso-ssh" {
  name          = var.name
  description   = var.description

  ingress {                          
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cdirs_acesso_remoto   
  }
  tags = {                           
    Name = var.tag_name
  }
}
