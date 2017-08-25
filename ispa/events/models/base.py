from __future__ import unicode_literals

from django.db import models

class BaseModel(models.Model):

    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    class Meta: # pylint: disable=C1001
        abstract = True
        ordering = ['-created']
        app_label = 'events'
