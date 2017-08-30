#!/bin/bash
C_FORCE_ROOT='true' ./manage.py celery worker \
  -A config.celery \
  -Q
  <queue> \
  --log-file=/var/log/celery.log \
  --loglevel=INFO \
  --concurrency=4
