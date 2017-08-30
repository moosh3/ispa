import os

from .base import *  # noqa

# DEBUG
# ------------------------------------------------------------------------------
DEBUG = os.environ.get('DEBUG', default=True)
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

# django-extensions
# ------------------------------------------------------------------------------
INSTALLED_APPS += ['django_extensions', ]

# TESTING
# ------------------------------------------------------------------------------
TEST_RUNNER = 'django.test.runner.DiscoverRunner'

# CELERY
# ------------------------------------------------------------------------------
CELERY_ALWAYS_EAGER = True

BROKER_HOST = "rabbitmq"
BROKEN_VHOST = "ispa_host"
