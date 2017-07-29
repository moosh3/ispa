from django.db import models
from django.contrib.auth.models import User
from .eventlocation import EventLocation
from .eventtype import EventType

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)

class Member(models.Model):

    user = models.OneToOneField('auth.User')
    points = models.IntegerField()
    bio = models.CharField(max_length=1000, blank=True)

    def __str__(self):
        return '{}'.format(self.user.username)

    @property
    def name(self):
        return self.__str__()


class Event(models.Model):

    location = models.ForeignKey('EventLocation')
    creator = models.ForeignKey('auth.User')
    guests = models.ManyToManyField(
        Member,
        through='EventGuest',
    )
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True)
    is_active = models.BooleanField(default=True)
    name = models.CharField('Name', max_length=256, null=True, blank=True)
    points = models.IntegerField()
    eventtype = models.ForeignKey('EventType')

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


class EventGuest(models.Model):

    event = models.ForeignKey('Event', on_delete=models.CASCADE)
    user = models.OneToOneField('Member', on_delete=models.CASCADE)
    rsvp = models.BooleanField(default=False)

    def __str__(self):
        return 'EventGuestRSVP: {} - {}'.format(
            self.user.username,
            self.event.name
        )

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_guest_rsvp(cls, event, user, rsvp=False):
        obj, _ = cls.objects.get_or_create(event=event, user=user)
        obj.rsvp = rsvp
        obj.save()
        return obj

    class Meta:
        unique_together = ('user', 'event')
        ordering = ('user__username',)
