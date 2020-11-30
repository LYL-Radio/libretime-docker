#!/bin/bash

chown -R www-data:www-data /srv/airtime
chown -R www-data:www-data /etc/airtime

exec "$@"