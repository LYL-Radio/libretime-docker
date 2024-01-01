#!/bin/bash

chown -R www-data:www-data /etc/libretime
chown -R www-data:www-data /srv/libretime

exec "$@"