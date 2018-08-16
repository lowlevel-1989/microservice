#!/bin/sh

chown -R app:app /app
chown -R app:app /home/app
exec su -m app -c 'celery -A service worker -l info'
