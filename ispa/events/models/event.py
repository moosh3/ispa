<<<<<<< HEAD
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

import uuid

from core.models import BaseModel
from .eventlocation import EventLocation
from .eventtype import EventType

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)

    def is_owner(self):
        return self.get_queryset().filter(owner=User)


class Event(BaseModel):

    location = models.ForeignKey('EventLocation')
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def to_json(self):
        return {
            'event': {
                'event_id': self.event.pk,
                'slug': self.event.slug,
                'name': self.event.name,
            },
            'location': self.eventlocation.to_json(),
            'description': self.description,
            'is_active': self.is_active,
            'created': self.created.isoformat(),
            'modified': self.modified.isoformat(),
        }


    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'
=======
from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

import uuid

from core.models import BaseModel
from .eventlocation import EventLocation
from .eventtype import EventType

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)

    def is_owner(self):
        return self.get_queryset().filter(owner=User)


class Event(BaseModel):

    location = models.ForeignKey('EventLocation')
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return 'Event: {}'.format(self.name)

    def to_json(self):
        return {
            'event': {
                'event_id': self.event.pk,
                'slug': self.event.slug,
                'name': self.event.name,
            },
            'location': self.eventlocation.to_json(),
            'description': self.description,
            'is_active': self.is_active,
            'created': self.created.isoformat(),
            'modified': self.modified.isoformat(),
        }


    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'
>>>>>>> 545c833f37e5ce15bfa5d5fc2a01af6a04b9635f
