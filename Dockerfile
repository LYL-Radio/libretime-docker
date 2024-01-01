FROM ubuntu:20.04

LABEL maintainer "me@maxep.me"
LABEL description "Libretime Radio Broadcast Docker Image"
LABEL org.opencontainers.image.source https://github.com/LYL-Radio/libretime-docker

ARG VERSION=3.2.1

RUN apt-get update && \
    apt-get install --no-install-recommends -y apt-utils && \
    apt-get install -y \
        wget

COPY systemctl.py /usr/bin/systemctl

RUN wget https://github.com/libretime/libretime/releases/download/$VERSION/libretime-$VERSION.tar.gz
RUN tar -xvf libretime-$VERSION.tar.gz

# LibreTime Install
RUN cd /libretime && ./install --no-setup-icecast --no-setup-postgresql --no-setup-rabbitmq

# Clean-up Install
RUN rm -rf /libretime

WORKDIR /

VOLUME ["/etc/libretime", "/srv/libretime"]

EXPOSE 80 8001 8002

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh", "/usr/bin/systemctl" ]