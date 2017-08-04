from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify


class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Event(models.Model):

    EVENT = 8
    SEMESTER = 5
    MEETING = 3

    EVENT_TYPE = (
        (EVENT, 'event'),
        (SEMESTER, 'semester'),
        (MEETING, 'meeting')
    )

    location = models.ForeignKey('EventLocation')
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)
    owners = models.ManyToManyField(
        'auth.User',
        related_name='owners',
        through='Owner',
    )
    guests = models.ManyToManyField(
        'auth.User',
        related_name='members',
        through='Member',
    )
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
    event_type = models.CharField('Event Type', max_length=128, null=True,
                                  blank=True, choices=EVENT_TYPE)
    objects = EventManager()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    def __unicode__(self):
        return __str__()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    @classmethod
    def create_event(cls, location, guests, date,
                     description, is_active, name, points, event_type):
        return cls.objects.create(
            location=location,
            owners=owners,
            guests=guests,
            date=date,
            description=description,
            is_active=is_active,
            name=name,
            points=points,
            event_type=event_type,
            slug=slugify(name)
        )

    def to_json(self):
        return {
            'location': self.location.to_json(),
            'owners': self.owners.to_json(),
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
