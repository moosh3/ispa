#!/bin/bash

set -e

source dev.env

sleep 5s

C_FORCE_ROOT='true' celery worker -A config.celery -Q default
