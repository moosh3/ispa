#!/bin/sh

set -e

export DJANGO_SETTINGS_MODULE="config.settings.local"

python manage.py migrate
python manage.py runserver_plus 0.0.0.0:8000
