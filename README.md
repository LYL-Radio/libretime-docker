# [LibreTime](https://libretime.org/) Docker Image
![Docker Image CI](https://github.com/LYL-Radio/libretime-docker/workflows/Docker%20Image%20CI/badge.svg)

A simple LibreTime image for multi-container environment expecting Postgres, Rabbitmq, and Icecast to be set up externally.

## Install

```bash
docker pull ghcr.io/lyl-radio/libretime:latest
```

This repo also provides a `docker-compose.yml` configuration for a quick setup.

If you already have an initialized Database, you can directly mount the volume `/etc/airtime/airtime.conf` with your configuration. If you are running LibreTime for the first time with a fresh Database, you will be required to go through the LibreTime setup wizard. It is strongly recommended to mount `/etc/airtime` to save the generated configuration file.

It is also strongly recommended to mount your media folder to a persistent storage, `/srv/airtime/stor` by default. Alternatevely, you can use the [libretime-s3fs](https://github.com/LYL-Radio/libretime-s3fs-docker) docker image to save your media library to a S3 storage.

## Credits

This image is based on work from:
- [ned-kelly/docker-multicontainer-libretime](https://github.com/ned-kelly/docker-multicontainer-libretime)
- [kessibi/libretime-docker](https://github.com/kessibi/libretime-docker)
- [gdraheim/docker-systemctl-replacement](https://github.com/gdraheim/docker-systemctl-replacement)
