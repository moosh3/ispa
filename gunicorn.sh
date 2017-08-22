#!/bin/bash

export DJANGO_SETTINGS_MODULE=config.settings.production

python manage.py migrate
python manage.py collectstatic --clear --noinput # Remove current static files
python manage.py collectstatic --noinput

# Prepare log files and outputting via stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log

exec gunicorn config.wsgi:application \
  -b 0.0.0.0:8080
  --name ispa \
  --workers 3 \
  --log-level=info \
  --log-file=/srv/logs/access.log
