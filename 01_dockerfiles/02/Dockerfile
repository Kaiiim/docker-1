FROM debian

MAINTAINER kkhalfao <kkhalfao@student.42.fr>

### Installation des packets
### export pour ne pas avoir de soucis d'installation ou mot de passe - se fait en root
 
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install apt-utils -y

### Configuration des ports - Voir fichier ts3server.ini 
EXPOSE 9987
EXPOSE 30033
EXPOSE 10011

### Creation de l'user et du dossier dans lequel la data va etre
RUN adduser --system --home /home/teamspeak --gecos "Exe TS3 Server" --group teamspeak

### ADD decompresse automatiquement
WORKDIR /home/teamspeak
RUN wget http://ftp.4players.de/pub/hosted/ts3/releases/3.0.11/teamspeak3-server_linux-amd64-3.0.11.tar.gz
RUN tar -zxf teamspeak3-server_linux-amd64-3.0.11.tar.gz
RUN rm -rf teamspeak3-server_linux-amd64-3.0.11.tar.gz

### le fichier de configuration ts3server.ini non present par default

COPY ts3server.ini /home/teamspeak/teamspeak3-server_linux-amd64/

### commande de lancement du script server
CMD /home/teamspeak/teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh start

# docker build -t karimm
# #docker run -it --rm -p=9987:9987/udp  -p=10011:10011 -p=30033:30033 karimm
