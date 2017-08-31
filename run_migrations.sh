#!/bin/bash

set -c

python manage.py makemigrations --no-input --settings=config.settings.production
python manage.py migration --no-input --settings=config.settings.production
