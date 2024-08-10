# Projet DevOps Maxime Etcheverria Clément Pagès
# Comment ça fonctionne ?
La première partie concerne Terraform. Ici, il s'occupera de créer une instance AWS EC2 qui permettra d'accueillir notre serveur web.
Une fois cette instance créée, il l'image Docker contenant le serveur web est déposée sur l'instance grâce a un playbook Ansible.
En théorie, le build et le déploiement aurait dû être fait par Ansible. Cependant, dans notre cas cela ne fonctionne pas via Ansible.

A la racine du projet se trouve le nécessaire pour jouer les commandes Terraform. Il y a aussi les fichiers .yml pour Ansible. 
Dans le dossier webapp se trouve l'image Docker ainsi que le serveur web.

# Lancer le projet

```
terraform init
terraform apply

ansible-playbook  -i hosts securitygroups.yml
ansible-playbook  -i hosts deploy.yml
```
# Déroulement du playbook Ansible
Comme dit précédemment nous n'avons pas réussi à construire notre image Docker sur l'instance EC2. 


<img width="1361" alt="image" src="https://github.com/user-attachments/assets/78117104-6ea7-4d7a-96b1-a0cbe953ec93">
