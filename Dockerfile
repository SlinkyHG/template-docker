FROM alpine:3.7
# Choisir une image système (Alpine si possible, c'est le moins lourd, sinon Debian Strech Slim, ect.. en slim)
# Pensez à bien fixer la version de l'os, qu'on se retrouve pas a build un dockerfile avec une vulne patchée deux jours avant le ctf...
# Dans le cas où vous avez besoin d'une version spécifique d'un CMS par exemple, allez sur le docker hub, et selectionnez la version que vous souhaitez de l'appli
# Si possible, tentez de respecter un max le choix de l'os, c'est généralement possible même pour des cms

# Installer tous les packets dont vous avez besoin. 
#Pour les failles de sécu liés à une version, Fixez les versions (précisez la dans le nom du paquet si possible, sinon, donnez au moins la version en commentaire), préférez les versions portables qu'apt/apk/yum
RUN apk add --no-cache \
  apache2-utils
  
# Ajouter tous les fichiers nécéssaires (flag, app, binaire, scripts...)
ADD build/<Nom_du_chall>/entrypoint.sh

# Si c'est du web, mettre un commentaire si c'est https/http et exposer le port voulu (laissez le port par défaut, on mappera)
EXPOSE 80

# Si besoin de garder en mémoire des données dans le cas d'un restart de conteneur
VOLUME /var/www

# Tant que faire se peux, mettre des HEALTHCHECK pour vérifier que le chall fonctionne encore.
# Si possible, tester le payload pour vérifier que le flag est tjs récupérable
# Cf. https://w3blog.fr/2017/01/31/docker-health-check/
HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

#Définir les varaibles d'environnement par défaut si non précisées pour le setup du conteneur/fonctionnement, optionnel.
ENV monFlag=blablabla{qsdqsgsdgkmlfmlfq}

# Soit vous démarrez l'appli directement, soit vous éxécutez un script qui configure votre appli au démarrage
ENTRYPOINT ["/entrypoint.sh"]
