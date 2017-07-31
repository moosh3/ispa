from django.db import models
from django.contrib.auth.models import User

from .eventlocation import EventLocation

from events.constants import (
    EVENT,
    MEETING,
    SEMESTER
)

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Event(models.Model):

    EVENT_TYPE_CHOICES = (
        (EVENT, EVENT.capitalize()),
        (MEETING, MEETING.capitalize()),
        (SEMESTER, SEMESTER.capitalize()),
    )

    location = models.ForeignKey('EventLocation')
    creator = models.ForeignKey('auth.User')
    guests = models.ManyToManyField(
        'auth.User',
        related_name='guests',
        through='Guest',
    )
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)
    points = models.IntegerField()
    eventtype = models.CharField(max_length=128,
        choices=EVENT_TYPE_CHOICES, default=EVENT,
    )

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return 'Event: {}'.format(self.name)

    def __unicode__(self):
        return __str__()

    class Meta:
        ordering = ('name',)

    #def get_absolute_url(self):
    #    return reverse('profile', args=[self.user.username])


class Guest(models.Model):

    event = models.ForeignKey('Event')
    member = models.ForeignKey('auth.User')
    rsvp = models.BooleanField(default=False)

    def __str__(self):
        return 'Guest: {} - {}'.format(
            self.user.username,
            self.event.name
        )

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_guest(cls, event, user, rsvp=False):
        obj, _ = cls.objects.get_or_create(event=event, user=user)
        obj.rsvp = rsvp
        obj.save()
        return obj
