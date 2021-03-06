#VM optimisation : docker-machine create --driver virtualbox --virtualbox-memory "4096" --virtualbox-cpu-count "2" Char

FROM debian

MAINTAINER kkhalfao <kkhalfao@student.42.fr>

WORKDIR /

# Initialisation
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
	ca-certificates \
	openssh-server \
	curl \
	postfix \
	vim \
	git 

# Authorisation de connexion root 
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:qwerty' | chpasswd

# Gitlab-CE installation
RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
RUN bash script.deb.sh
RUN apt-get update && apt-get install -y gitlab-ce

# Installation du tzdata -> certains cas ca bloque
RUN apt update \
	&& apt install -y tzdata \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# exposition des ports du container
EXPOSE 22 2222 80 443

# HTPPS
## Chrome exige que les sites utilisent des certificats provenant d'organismes approuvés -> Safari
## https://support.google.com/chrome/answer/95617?visit_id=636857337119823275-565487570&p=ui_security_indicator&rd=1 
## Creation ssl
RUN mkdir -p /etc/gitlab/ssl
RUN chmod 700 /etc/gitlab/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-subj /C=FR/ST=75/L=Paris/O=42/OU=42/CN=192.168.99.100/emailAddress=kkhalfao@student.42.fr \
	-keyout /etc/gitlab/ssl/selfsigned.key -out /etc/gitlab/ssl/selfsigned.crt


## Changement des configs du fichier gitlab.rb

ENV var1="external_url 'http:\/\/gitlab.example.com'" \
	var2="external_url 'https:\/\/192.168.99.100'" \
	\
	var5="# nginx\['redirect_http_to_https'\] = false" \
	var6="nginx\['redirect_http_to_https'\] = true" \
	\
	var7="# nginx\['ssl_certificate'\] = \"\/etc\/gitlab\/ssl\/#{node\['fqdn'\]}.crt\"" \
	var8="nginx\['ssl_certificate'\] = \"\/etc\/gitlab\/ssl\/selfsigned.crt\"" \
	\
	var9="# nginx\['ssl_certificate_key'\] = \"\/etc\/gitlab\/ssl\/#{node\['fqdn'\]}.key\"" \
	var10="nginx\['ssl_certificate_key'\] = \"\/etc\/gitlab\/ssl\/selfsigned.key\"" \
	\
	var11="# gitlab_rails\['gitlab_shell_ssh_port'\] = 22" \
	var12="gitlab_rails\['gitlab_shell_ssh_port'\] = 2222"

RUN sed -i -e "s/$var1/$var2/g" /etc/gitlab/gitlab.rb \
	&& sed -i -e "s/$var5/$var6/g" /etc/gitlab/gitlab.rb \ 
	&& sed -i -e "s/$var7/$var8/g" /etc/gitlab/gitlab.rb \ 
	&& sed -i -e "s/$var9/$var10/g" /etc/gitlab/gitlab.rb \ 
	&& sed -i -e "s/$var11/$var12/g" /etc/gitlab/gitlab.rb  


WORKDIR /

ENTRYPOINT service ssh start \
			&& (/opt/gitlab/embedded/bin/runsvdir-start &) \
			&& gitlab-ctl reconfigure \
			&& gitlab-ctl tail

# docker build -t karim/ex03/01 .
# docker run --name gitlab-ce-k -it -p 80:80 -p 2222:22 -p 443:443 --privileged --rm karim/ex03/01
# creation clef ssh : ssh-keygen -t rsa -C "kkhalfao@student.42.fr"
