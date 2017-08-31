from __future__ import unicode_literals
import os

from django.utils.encoding import python_2_unicode_compatible
from django.contrib.contenttypes.fields import GenericRelation
from django.db import models
from django.utils.text import slugify
from django.core.urlresolvers import reverse
from django.utils.translation import ugettext
from django.utils.translation import ugettext_lazy as _
from django.utils import timezone

from events.models.base import BaseModel

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)

def image_field(instance, filename):
    return os.path.join('events', str(instance.user.pk), filename)

@python_2_unicode_compatible
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
    max_guests = models.PositiveIntegerField(null=True, blank=True)
    start = models.DateTimeField(
        default=timezone.now(),
        verbose_name=_('Start date'),
    )
    end = models.DateTimeField(
        default=timezone.now() + timezone.timedelta(days=1),
        verbose_name=_('End date'),
    )
    venue = models.CharField(max_length=100, blank=True)

    contact_person = models.CharField(max_length=100, blank=True, null=True)
    contact_email = models.CharField(max_length=100, blank=True, null=True)
    contact_phone = models.CharField(max_length=100, blank=True, null=True)

    available_seats = models.PositiveIntegerField(
        verbose_name=_('Available seats'),
        help_text=_(
            'Set this to a number if only a limited amount of slots are '
            ' available for this event. If you chose to display this on your'
            ' site, you can create a sense of urgency for your users to'
            ' RSVP before all slots are taken. As soon as all slots are taken,'
            ' users cannot RSVP for this event any more.'),
        blank=True, null=True,
    )

    hide_available_seats = models.BooleanField(
        default=False,
        verbose_name=_('Hide available seat information'),
        help_text=_(
            'If you set the number of available seats you can check this field'
            ' in order to hide that number from your users.'),
    )

    allow_anonymous_rsvp = models.BooleanField(
        default=False,
        verbose_name=_('Allow anonymous RSVP'),
        help_text=_('Even anonymous users can rsvp, without adding any info.'),
    )

    objects = EventManager()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    def get_free_seats(self):
        reserved = self.guests.all().aggregate(models.Sum('number_of_seats'))
        if self.available_seats:
            return self.available_seats - int(reserved.get(
                'number_of_seats__sum') or 0)
        return _('Unlimited seats available.')

    def is_bookable(self):
        if self.start < timezone.now():
            return False
        return True

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

    class Meta: # pylint: disable=C1001
        ordering = ('date',)

    # def get_absolute_url(self):
    #    return reverse('profile', args=[self.user.username])
