from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.core.urlresolvers import reverse

from events.models.base import BaseModel

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)

def image_field(instance, filename):
    return os.path.join('events', str(instance.user.pk), filename)


class Event(BaseModel):

    EVENT = 'event'
    SEMESTER = 'semester'
    MEETING = 'meeting'

    EVENT_TYPE = (
        (EVENT, 'Event'),
        (SEMESTER, 'Semester'),
        (MEETING, 'Meeting')
    )

    name = models.CharField('Name', max_length=256, null=True, blank=True)
    points = models.PositiveIntegerField(blank=True, null=True)
    description = models.CharField(
        'Description', max_length=512,
        null=True, blank=True)
    extended_description = models.TextField(blank=True, null=True)
    image = models.ImageField(upload_to=image_field, null=True, blank=True)
    location = models.ForeignKey('EventLocation')
    date = models.DateTimeField(
        'Event Date', null=True,
        blank=True, auto_now=False
    )
    is_active = models.BooleanField(default=True)
    event_type = models.CharField('Event Type', max_length=128, null=True,
                                  blank=True, choices=EVENT_TYPE)
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)
    attendees = models.ManyToManyField(
        'auth.User',
        related_name='attendees',
        through='Attendance',
    )
    objects = EventManager()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_event(cls, slug, location, attendees, date,
                     description, is_active, name, points, event_type):
        return cls.objects.create(
            location=location,
            attendees=attendees,
            date=date,
            description=description,
            is_active=is_active,
            name=name,
            points=points,
            event_type=event_type,
            slug=slug,
        )

    def to_json(self):
        return {
            'location': self.location.to_json(),
            'attendees': '',
            'date': self.date,
            'description': self.description,
            'is_active': self.is_active,
            'name': self.name,
            'points': self.points,
            'event_type': self.event_type,
            'slug': slugify(self.name),
        }

    class Meta:
        ordering = ('name',)

    # def get_absolute_url(self):
    #    return reverse('profile', args=[self.user.username])
