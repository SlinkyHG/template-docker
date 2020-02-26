# template-docker

## Commandes utiles: 
```
docker-compose build <nom du service:optionnel> # Build toutes les images de la stack docker-compose
docker-compose up -d <nom du service:optionnel> # Démare tous les services de la stack docker-compose
docker-compose stop <nom du service:optionnel> # Stop la stack mais ne supprime rien
docker-compose logs -f <nom du service:optionnel> # Affiche les logs en temps réels des services
docker compose ps # Affiche le status des services de la stack
docker-compose down # Supprime toutes les données non bind dans des volumes
```

# Liens utiles : 
## Installer
https://docs.docker.com/install/

https://docs.docker.com/compose/install/

# Documentations utiles
https://docs.docker.com/compose/compose-file/

https://w3blog.fr/2017/01/31/docker-health-check/
