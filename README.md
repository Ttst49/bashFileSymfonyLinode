# bashFileSymfonyLinode

Fournit un script bash qui permet la création d'un environnement complet sur linode/vultr pour utiliser des projets symfony
## Vous devez changer dans le script seulement 2 variables
### PGADMIN_SETUP_PASSWORD=!changeMe! PGADMIN_SETUP_EMAIL=email@example.com /usr/pgadmin4/bin/setup-web.sh --yes
ce sera pour la création d'une interface pgAdmin4


vous n'avez plus qu'à changer le .conf pour le faire correspondre à vos besoins, a2ensite le fichier conf, restart apache2 et utiliser certbot qui est déjà installé pour obtenir un certificat valide pour votre site


pour lancer le script il vous faut installer la cli de github et vous auth:

https://github.com/cli/cli/blob/trunk/docs/install_linux.md

gh auth login

gh repo clone Ttst49/bashFileSymfonyLinode

chmod 777 ./apache.sh
