from .base import *

# SECRET CONFIGURATION
# ------------------------------------------------------------------------------
# See: https://docs.djangoproject.com/en/dev/ref/settings/#secret-key
# Raises ImproperlyConfigured exception if DJANGO_SECRET_KEY not in os.environ
SECRET_KEY = 'y*$m6ms2fejwl)4nkhy5%@k4(n-@35e%60dtxl!=l%0sb&*0^f'

# This ensures that Django will be able to detect a secure connection
# properly on Heroku.


# SECURITY CONFIGURATION
# ------------------------------------------------------------------------------
DEBUG = False

# SITE CONFIGURATION
# ------------------------------------------------------------------------------
# Hosts/domain names that are valid for this site
# See https://docs.djangoproject.com/en/dev/ref/settings/#allowed-hosts
ALLOWED_HOSTS = ['*']
# END SITE CONFIGURATION

# EMAIL

# TEMPLATE CONFIGURATION
# ------------------------------------------------------------------------------
# See:
TEMPLATES[0]['OPTIONS']['loaders'] = [
    ('django.template.loaders.cached.Loader', [
        'django.template.loaders.filesystem.Loader',
        'django.template.loaders.app_directories.Loader',
    ]),
]

# DATABASE CONFIGURATION
# ------------------------------------------------------------------------------
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres', # Database name, *Not* the cloudsql instance name
        'USER': 'dev',
        'PASSWORD': 'justtestit',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    },
}

# CACHING # TODO
# ------------------------------------------------------------------------------
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": "redis://127.0.0.1:6379/1",
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
        }
    }
}

SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"
