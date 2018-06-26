#!/bin/sh
exec su -m app -c 'celery -A service beat -l info -S django --pidfile=/home/app/celery.pid'
