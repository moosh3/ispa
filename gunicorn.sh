#!/bin/bash

export DJANGO_SETTINGS_MODULE=ispa.config.settings.prod

python manage.py migrate
python manage.py collectstatic --clear --noinput # Remove current static files
python manage.py collectstatic --noinput

# Prepare log files and outputting via stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log

exec gunicorn ispa.config.wsgi:application \
  -b 0.0.0.0:5000
  --chdir=/ispa
  --name ispa \
  --workers 3 \
  --log-level=info \
  --log-file=/srv/logs/access.log
