from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify

from modelcluster.models import ClusterableModel
from modelcluster.fields import ParentalManyToManyField

from .eventlocation import EventLocation
from .owner import Owner
from ispa_app.models import Member

from events.constants import (
    EVENT,
    MEETING,
    SEMESTER
)


class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Event(ClusterableModel):

    EVENT_TYPE_CHOICES = (
        (EVENT, EVENT.capitalize()),
        (MEETING, MEETING.capitalize()),
        (SEMESTER, SEMESTER.capitalize()),
    )

    location = models.ForeignKey('EventLocation')
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)
    owners = models.ManyToManyField(
        'auth.User',
        related_name='owners',
        through='Owner',
    )
    guests = ParentalManyToManyField(Member, related_name='events')
    date = models.DateTimeField(
        'Event Date', null=True,
        blank=True, auto_now=False
    )
    description = models.CharField(
        'Description', max_length=512,
        null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)
    points = models.IntegerField()
    eventtype = models.CharField(max_length=128,
                                 choices=EVENT_TYPE_CHOICES, default=EVENT)

    objects = EventManager()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return 'Event: {}'.format(self.name)

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_event(cls, location, owners, guests, date,
                     description, is_active, name, points, eventtype):
        obj = cls.create(
            location=location,
            owners=owners,
            guests=guests,
            date=date,
            description=description,
            is_active=is_active,
            name=name,
            points=points,
            eventtype=eventtype,
            slug=slugify(name)
        )

        return obj

    class Meta:
        ordering = ('name',)

    # def get_absolute_url(self):
    #    return reverse('profile', args=[self.user.username])
