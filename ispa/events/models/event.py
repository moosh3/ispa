from django.db import models

from .eventlocation import EventLocation
from .eventtype import EventType

from core.models import MemberProfile

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Event(models.Model):

    location = models.ForeignKey('EventLocation')
    guests = models.ManyToManyField(
        MemberProfile,
        through='EventGuest',
        through_fields=('group', 'member'),
    )
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)
    points = models.IntegerField()

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    def __str__(self):
        return 'Event: {}'.format(self.name)

    def __unicode__(self):
        return __str__()

    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'


class EventGuest(BaseModel):

    event = models.ForeignKey('Event', on_delete=models.CASCADE)
    person = models.ForeignKey('MemberProfile', on_delete=models.CASCADE)
    rsvp = models.BooleanField(default=false)
