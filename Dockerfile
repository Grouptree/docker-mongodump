FROM mongo:latest

MAINTAINER Potiguar Faga <potz@potz.me>

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
