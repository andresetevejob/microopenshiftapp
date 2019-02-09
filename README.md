# microopenshiftapp
# Ce tutoriel a pour but de presenter un microservice avec les technologies (Spring boot,Docker,Kubernetes, Openshift)

# Installation de docker
voir le lien suivant pour une installation sur les plateformes linux: https://docs.docker.com/install/linux/docker-ce/fedora/

# Docker

-Pour demarrer docker en tant que service sur votre système executez, la commande suivante :

   ##### sudo systemctl start docker

-Maintenant que  Docker est demarré, vous pouvez creer votre premier container avec la commande suivante :
   sudo docker run hello-world
NB: si l'image n'existe pas sur votre machine,Docker ira le téléchargé depuis son hub distant.C'est un peu ce
que fait maven,lorsque nous avons des dépendances qui n'existent pas notre repository local

# Containerizing a Spring Boot MicroOpenshfitApp Applicaton
-Cloner l'application exemple sur votre machine : https://github.com/andresetevejob/microopenshiftapp

-Cette application contient un fichier Dockerfile, c'est lui qui nous permettra de creer l'image de l'application sur
 votre machine

-Les instructions à l'interieur du fichier sont les suivantes
 //Notre image de base contient OpenJDK
 ##### FROM openjdk

 //Ajouter la jar dans notre image
 ##### COPY target/microopenshiftapp-0.0.1-SNAPSHOT.jar /

 //Commande d'execution par défaut
 ##### CMD java -jar /microopenshiftapp-0.0.1-SNAPSHOT.jar

 NB: Chaque instruction est précédée de son commentaire.Les commentaires avec Dockerfile commencent par # et //
 Nous avons utiliser // pour faire la difference avec celle que nous utilisons dans notre markdown github

-Creation du build maven :
  ##### mvn package

-Creation de l'image docker
 ##### sudo docker build -t microapp .

le flag -t specifie le nom de l'image docker de notre application qui est ici : "microapp"
Le point "." à la fin de la commande instruit le daemon Docker que notre fichier DockerFile se trouve dans le repertoire de notre
projet

#Demmarrer l'application au sein du container

- ##### sudo docker run -d --name microapp-img -p 8080:8080 microapp

le flag -d permet de demarrer le container en background
le flag --name precise le nom du container.Si il est absent docker donnera un nom par défaut

- ##### sudo docker ps

permet d'afficher les container qui tournent sur la machine.vous devriez voir apparaitre le nom de
votre container.si tel est le cas il est maintenant accessible à partir de l'url http://localhost:8080/api/hello

- ##### sudo docker logs microapp-img

permet de voir les logs de notre container

# Publier votre image sur le hub de Docker
-Creez vous un compte sur le hub de docker

-Connectez vous à votre espace sur le hub en ligne de commande sur votre machine :

 sudo docker login

-Transferer l'image vers le hub docker

 ##### docker tag microapp <your username>/microapp-tuto

Cette commande permet de donner un tag à votre image sur le hub de docker.

 ##### sudo docker push <your username>/microapp-tuto

Transfert de l'application vers le hub de docker


# DANS LA PROCHIANE SEANCE NOUS ALLONS VOIR COMMENT SCALER NOTRE APPLICATION AVEC OPENSHIFT