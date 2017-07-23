#!/bin/sh
set -e

#python manage.py makemigrations --no-input
#python manage.py migrate --no-input
python manage.py runserver_plus 0.0.0.0:8000
