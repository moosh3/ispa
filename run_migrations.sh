#!/bin/bash

set -c

python manage.py makemigrations --no-input
python manage.py migration --no-input
