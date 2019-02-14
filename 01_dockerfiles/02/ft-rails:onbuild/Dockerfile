FROM ruby:2.5.1

# Initialisation
RUN apt-get update && apt-get install -y nodejs
RUN gem install rails bundler

# Copy app 
COPY app /opt/app
WORKDIR /opt/app

## Config app
ONBUILD RUN bundler install
ONBUILD RUN rails db:migrate
ONBUILD RUN rails db:seed

#docker build -t ft-rails:on-build .
#docker run -it -p 3000:3000 --rm ft-rails:on-build
