import socket
import os

from .base import *  # noqa

# DEBUG
# ------------------------------------------------------------------------------
DEBUG = True
TEMPLATES[0]['OPTIONS']['debug'] = DEBUG

# SECRET CONFIGURATION
# ------------------------------------------------------------------------------
# See: https://docs.djangoproject.com/en/dev/ref/settings/#secret-key
# Note: This key only used for development and testing.
SECRET_KEY = 'y*$m6ms2fejwl)4nkhy5%@k4(n-@35e%60dtxl!=l%0sb&*0^f'

# CACHING
# ------------------------------------------------------------------------------
CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.locmem.LocMemCache',
        'LOCATION': ''
    }
}

# django-debug-toolbar
# ------------------------------------------------------------------------------

INTERNAL_IPS = ['127.0.0.1', '10.0.2.2', ]
# This is a workaround to flake8 "imported but unused" errors #}
# tricks to have debug toolbar when developing with docker
ip = socket.gethostbyname(socket.gethostname())
INTERNAL_IPS += [ip[:-1] + '1']
# django-extensions
# ------------------------------------------------------------------------------
#INSTALLED_APPS += ['django_extensions', ]

# TESTING
# ------------------------------------------------------------------------------
TEST_RUNNER = 'django.test.runner.DiscoverRunner'
# Your local stuff: Below this line define 3rd party library settings
# ------------------------------------------------------------------------------
