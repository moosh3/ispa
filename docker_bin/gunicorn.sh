#!/bin/bash

set -e

source ./prod.env

python manage.py migrate
python manage.py collectstatic --clear --noinput # Remove current static files
python manage.py collectstatic --noinput

exec gunicorn config.wsgi:application \
  -b 0.0.0.0:8080
  --name ispa \
  --workers 3
