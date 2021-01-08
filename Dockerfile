FROM ubuntu:18.04

LABEL maintainer "me@maxep.me"
LABEL description "Libretime Radio Broadcast Docker Image"
LABEL org.opencontainers.image.source https://github.com/LYL-Radio/libretime-docker

ARG BRANCH=master

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y apt-utils && \
    apt-get install -y \
        software-properties-common \
        locales \
        git

RUN locale-gen --purge en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

COPY systemctl.py /usr/bin/systemctl

RUN git clone --depth=1 --branch=$BRANCH https://github.com/LibreTime/libretime.git /src

# Prepare LibreTime Install
RUN SYSTEM_INIT_METHOD=`readlink --canonicalize -n /proc/1/exe | rev | cut -d'/' -f 1 | rev` && \
    sed -i 's/\*systemd\*)/\*'"$SYSTEM_INIT_METHOD"'\*)/g' /src/install && \
    touch /tmp/icecast_pass

# LibreTime Install
RUN cd /src && ./install --force --apache --no-postgres --no-rabbitmq

# Clean-up Install
RUN rm -rf /src
RUN apt-get remove -y postgresql rabbitmq-server icecast2

# Enable Services
RUN systemctl enable apache2 && \
    systemctl enable libretime-liquidsoap && \
    systemctl enable libretime-playout && \
    systemctl enable libretime-celery && \
    systemctl enable libretime-analyzer

WORKDIR /

VOLUME ["/etc/airtime", "/srv/airtime/stor"]

EXPOSE 80 8001 8002

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh", "/usr/bin/systemctl" ]