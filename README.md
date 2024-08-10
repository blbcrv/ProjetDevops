# Comment ça fonctionne ?
La première partie concerne Terraform. Ici, il s'occupera de créer une instance AWS EC2 qui permettra d'accueillir notre serveur web.
Une fois cette instance créée, il l'image Docker contenant le serveur web est déposée sur l'instance grâce a un playbook Ansible.
En théorie, le build et le déploiement aurait dû être fait par Ansible. Cependant, dans notre cas cela ne fonctionne pas via Ansible.

# Lancer le projet

```
terraform init
terraform apply

ansible-playbook  -i hosts securitygroups.yml
ansible-playbook  -i hosts deploy.yml
```
