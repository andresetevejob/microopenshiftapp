#Notre image de base contient OpenJDK
FROM openjdk

#Ajouter la jar dans notre image

COPY target/microopenshiftapp-0.0.1-SNAPSHOT.jar /

#Commande d'execution par défaut

CMD java -jar /microopenshiftapp-0.0.1-SNAPSHOT.jar
