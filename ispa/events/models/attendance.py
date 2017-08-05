from django.db import models
from django.contrib.auth.models import User


class Attendance(models.Model):

    user = models.ForeignKey('auth.User', related_name='events',)
    event = models.ForeignKey('Event', related_name='attendees')
    did_attend = models.BooleanField(default=False)
    def __str__(self):
        return '{}'.format(self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__str__()

    @classmethod
    def create_attendee(cls, user, event, did_attend):
        return cls.objects.create(
            user=user,
            event=event,
            did_attend=False,
        )
