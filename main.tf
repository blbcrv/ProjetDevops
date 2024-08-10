provider "aws" {
  region = "eu-west-1"  # Région AWS où tu veux déployer l'instance
}

# Créer ou importer une paire de clés SSH sur AWS
resource "aws_key_pair" "key_pair" {
  key_name   = "keyPairIPIDevOps"             # Nom de la clé SSH sur AWS
  public_key = file("~/.ssh/id_rsa_2048.pub")
}

# Définir un profil IAM pour autoriser l'instance EC2 à utiliser SSM
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_profile"
}


# Créer une instance EC2 en utilisant la paire de clés SSH et le profil IAM SSM
resource "aws_instance" "web_server" {
  ami           = "ami-0c38b837cd80f13bb"    # AMI pour Ubuntu 22.04 LTS
  instance_type = "t2.micro"

  key_name               = aws_key_pair.key_pair.key_name  # Utilisation de la clé SSH
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name  # Associer le profil IAM pour SSM

  tags = {
    Name = "ProjetDevOpsWebServer"          # Nom de l'instance
  }
}

# Sortie de l'adresse IP publique de l'instance EC2
output "instance_ip" {
  value = aws_instance.web_server.public_ip
}

