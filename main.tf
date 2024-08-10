provider "aws" {
  region = "eu-west-1"
}

# Créer ou importer une paire de clés SSH sur AWS
resource "aws_key_pair" "key_pair" {
  key_name   = "keyPairIPIDevOps"            
  public_key = file("~/.ssh/id_rsa_2048.pub")
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c38b837cd80f13bb"   
  instance_type = "t2.micro"

  key_name               = aws_key_pair.key_pair.key_name 

  tags = {
    Name = "ProjetDevOpsWebServer"          
  }
}
