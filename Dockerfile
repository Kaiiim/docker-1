FROM debian

RUN apt-get update -y
RUN apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends
RUN apt-get install -y apt-utils 
RUN apt-get install -y curl openssh-server ca-certificates
RUN apt-get install git -y

#RUN apt-get install -y postfix 

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
RUN apt-get update && EXTERNAL_URL="http://gitlab.example.com" apt-get install gitlab-ee

# Expose web & ssh
EXPOSE 22 80

#RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh 


