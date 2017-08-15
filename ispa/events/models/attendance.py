from django.db import models
from django.contrib.auth.models import User


class Attendance(models.Model):

    user = models.ForeignKey('auth.User', related_name='events',)
    event = models.ForeignKey('Event')
    attending = models.BooleanField(default=True)
    is_owner = models.BooleanField(default=False)

    def __str__(self):
        return '{}'.format(self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__str__()

    @property
    def event_owner(cls, user, event, attending, is_owner):
        owner = cls.objects.get(
            user=user,
            event=event,
            attending=True,
            is_owner=True
        )
        return owner

    @classmethod
    def create_attendee(cls, user, event, attending, is_owner):
        return cls.objects.create(
            user=user,
            event=event,
            attending=attending,
            is_owner=is_owner,
        )
