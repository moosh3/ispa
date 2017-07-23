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

    slug = models.SlugField(unique=True)
    location = models.ForeignKey(EventLocation)
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)
    event_type = models.ForeignKey(EventType)

    def __str__(self):
        return 'EVENT {}'.format(self.event_id)

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    @classmethod
    def create_event(cls, event_id, owner, guests, name, slug,
                     address, address2, city, state, zipcode,
                     date, description, event_type):

        return cls.object.create(
            event_id=event_id,
            owner=owner,
            guests=guests,
            name=name,
            slug=slug,
            location=location,
            date=date,
            description=description,
            is_active=is_active,
            event_type=event_type
        )

    def to_json(self):
        return {
            'event': {
                'event_id': self.event.pk,
                'slug': self.event.slug,
                'name': self.event.name,
            },
            'guests': self.eventguest.to_json(),
            'location': self.eventlocation.to_json(),
            'description': self.description,
            'is_active': self.is_active,
            'related_object': self.related_object.to_json(),
            'owner': {
                'name': self.user.userprofile.name,
                'username': self.user.username,
                'pk': self.user.pk,
                'url': self.user.userprofile.get_absolute_url(),
            },
            'created': self.created.isoformat(),
            'modified': self.modified.isoformat(),
        }


    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'
