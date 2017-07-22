import os

from django.db import models

from core.models.base import BaseModel
from events.models.event import Event

class EventGuest(models.Model):

    event = models.ForeignKey('Event')
    guest = models.ForeignKey('auth.User')
    is_owner = models.BooleanField(default=False)

    def __str__(self):
        return 'EventGuest: {} - {}'.format(
            self.event.slug,
            self.user.userprofile.name,
        )

