# bashFileSymfonyLinode

Fournit un script bash qui permet la création d'un environnement complet sur linode/vultr pour utiliser des projets symfony


vous n'avez plus qu'à changer le .conf pour le faire correspondre à vos besoins, a2ensite le fichier conf, restart apache2 et utiliser certbot qui est déjà installé pour obtenir un certificat valide pour votre site


pour lancer le script il vous faut installer la cli de github et vous auth:

https://github.com/cli/cli/blob/trunk/docs/install_linux.md

gh auth login

gh repo clone Ttst49/bashFileSymfonyLinode

chmod 777 ./apache.sh
