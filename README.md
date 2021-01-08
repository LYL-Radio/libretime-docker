# [LibreTime](https://libretime.org/) Docker Image
![Docker Image CI](https://github.com/LYL-Radio/libretime-docker/workflows/Docker%20Image%20CI/badge.svg)

A simple LibreTime image for multi-container environment expecting Postgres, Rabbitmq, and Icecast to be set up externally.

You will be required to go through the LibreTime setup wizard when running for the first time, it is strongly recommended to mount `/etc/airtime` and `/srv/airtime/stor` folders to persistent volumes to store your configuration and media library.

## Install

```bash
docker pull ghcr.io/lyl-radio/libretime:latest
```

This repo also provides a `docker-compose.yml` configuration for a quick setup.
## Credits

This image is based on work from:
- [ned-kelly/docker-multicontainer-libretime](https://github.com/ned-kelly/docker-multicontainer-libretime)
- [kessibi/libretime-docker](https://github.com/kessibi/libretime-docker)
- [gdraheim/docker-systemctl-replacement](https://github.com/gdraheim/docker-systemctl-replacement)
