#!/bin/sh
mkdir -p /app/media
mkdir /home/app/logs

touch /home/app/logs/gunicorn-access.log
touch /home/app/logs/gunicorn.log
tail -n 0 -f /home/app/logs/*.log &

# evita error de permisos
chown -R app:app /app
chown -R app:app /home/app

exec su -m app -c 'gunicorn service.wsgi -b :8000
	--access-logfile /home/app/logs/gunicorn-access.log
	--error-logfile /home/app/logs/gunicorn.log'
