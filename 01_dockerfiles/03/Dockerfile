FROM ubuntu:16.04

RUN apt-get update -q

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y openssh-server ca-certificates wget
RUN apt-get install -y postfix

WORKDIR /

RUN apt-get update && wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh

RUN chmod 777 script.deb.sh && ./script.deb.sh && EXTERNAL_URL="http://gitlab.example.com" 
RUN apt-get install -y gitlab-ee


RUN apt-get update -y && apt-get install -y tzdata \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose HTTP/HTTPS & ssh
EXPOSE 22 80 443

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
