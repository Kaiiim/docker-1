# docker build -t ex00 .
# docker run -it --rm ex00

FROM alpine

MAINTAINER kkhalfao <kkhalfao@student.42.fr>

RUN apk update && apk upgrade
RUN apk add vim
ENTRYPOINT vim

