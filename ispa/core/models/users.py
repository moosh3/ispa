import os

from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse

from core.models.base import BaseModel
from events.models.event import Event

class UserProxy(User):

    def is_guest(self, event):
        guest_list = User.objects.filter(
            models.Q(eventguest__event=event))
        return guest_list.filter(pk=self.pk).exists()

    def is_event_creator(self, event):
        event_creator = self.eventguest_set.filter(
            event=event)
        return event_creator.filter(pk=self.pk).exists()

    @property
    def related_events(self):
        return Events.objects.filter(
            models.Q(event__eventguest__user=self)
        ).distinct()

    class Meta:
        proxy = True


class MemberProfile(BaseModel):

    USER = 'user'

    user = models.OneToOneField('auth.User')
    guest = models.ForeignKey(Event)
    bio = models.CharField(max_length=256, blank=True, null=True)
    points = models.IntegerField()

    def __str__(self):
        return '{}'.format(self.user.username)

    @property
    def name(self):
        return self.__str__()


class UserEventStatus(BaseModel):

    event = models.ForeignKey(Event)
    user = models.ForeignKey('auth.User')
    guest = models.BooleanField(default=False)

    def __str__(self):
        return 'UserEventStatus: {} - {}'.format(
            self.user.username,
            self.event.title
        )

    @classmethod
    def create_user_event_status(cls, event, user, guest=False):
        obj, _ = cls.objects.get_or_create(event=event, user=user)
        obj.read = read
        obj.save()
        obj
