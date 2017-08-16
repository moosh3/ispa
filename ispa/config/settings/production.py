from .base import *  # noqa

# SECRET CONFIGURATION
# ------------------------------------------------------------------------------
# See: https://docs.djangoproject.com/en/dev/ref/settings/#secret-key
# Raises ImproperlyConfigured exception if DJANGO_SECRET_KEY not in os.environ
SECRET_KEY = 'y*$m6ms2fejwl)4nkhy5%@k4(n-@35e%60dtxl!=l%0sb&*0^f'


# This ensures that Django will be able to detect a secure connection
# properly on Heroku.
SECURE_PROXY_SSL_HEADER = 'https'


# SECURITY CONFIGURATION
# ------------------------------------------------------------------------------

# set this to 60 seconds and then to 518400 when you can prove it works
SECURE_HSTS_SECONDS = 60
SECURE_BROWSER_XSS_FILTER = True
SESSION_COOKIE_SECURE = True
SESSION_COOKIE_HTTPONLY = True
SECURE_SSL_REDIRECT = True
CSRF_COOKIE_SECURE = True
CSRF_COOKIE_HTTPONLY = True
X_FRAME_OPTIONS = 'DENY'

# SITE CONFIGURATION
# ------------------------------------------------------------------------------
# Hosts/domain names that are valid for this site
# See https://docs.djangoproject.com/en/dev/ref/settings/#allowed-hosts
ALLOWED_HOSTS = '*'
# END SITE CONFIGURATION

# URL that handles the media served from MEDIA_ROOT, used for managing
# stored files.

# Static Assets
# ------------------------
# See: https://github.com/antonagestam/collectfast
# For Django 1.7+, 'collectfast' should come before
# 'django.contrib.staticfiles'

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
        'ENGINE': 'django.db.backends.postgresql,
        'NAME': 'postgres',
        'USER': os.getenv('DATABASE_USER'),
        'PASSWORD': os.getenv('DATABASE_PASSWORD'),
        'HOST': '127.0.0.1',
        'PORT': '5432',
    },
}

# CACHING # TODO
# ------------------------------------------------------------------------------
# Heroku URL does not pass the DB number, so we parse it in
# CACHES = {
#    'default': {
#        'BACKEND': 'django_redis.cache.RedisCache',
#        'LOCATION': REDIS_LOCATION,
#        'OPTIONS': {
#            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
#            'IGNORE_EXCEPTIONS': True,  # mimics memcache behavior.
#
#    }
# }

# FILE STORAGE
# ------------------------------------------------------------------------------
# The AWS region to connect to.
AWS_REGION = "us-east-1"

# The AWS access key to use.
AWS_ACCESS_KEY_ID = ""

# The AWS secret access key to use.
AWS_SECRET_ACCESS_KEY = ""

# The name of the bucket to store files in.
AWS_S3_BUCKET_NAME = ""

# Bucket for collectstatic
AWS_S3_BUCKET_NAME_STATIC = ""

AWS_S3_BUCKET_AUTH_STATIC = False

AWS_S3_MAX_AGE_SECONDS_STATIC =  60 * 60 * 24 * 365  # 1 year.

# File caching in browsers
AWS_S3_BUCKET_AUTH = False

AWS_S3_MAX_AGE_SECONDS = 60 * 60 * 24 * 365  # 1 year.
# TODO Add logging configuration

# Custom Admin URL, use {% raw %}{% url 'admin:index' %}{% endraw %}

# Your production stuff: Below this line define 3rd party library settings
# ------------------------------------------------------------------------------
