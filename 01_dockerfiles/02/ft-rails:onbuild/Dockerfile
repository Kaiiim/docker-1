FROM ruby

RUN apt-get update && apt-get install nodejs -y \
		&& apt-get autoclean -y \
		&& apt-get clean -y \
		&& gem install rails

# Copy l'application dans le repertoire du contener
ONBUILD COPY ../app /opt/app

# Installation 
ONBUILD RUN bundle install && \
			rake db:migrate && \
			rake db:setup && \
			rake db:seed

# repertoire de travail + ouverture du port
ONBUILD EXPOSE 3000
WORKDIR /opt/app

#docker build -t ft-rails:on-build .
#docker run -it --rm ft-rails:on-build
