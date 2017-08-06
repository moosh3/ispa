from django.db import models
from django.contrib.auth.models import User


class Attendance(models.Model):

    user = models.ForeignKey('auth.User', related_name='events',)
    event = models.ForeignKey('Event')
    status = models.BooleanField(default=False)
    is_owner = models.BooleanField(default=False)

    def __str__(self):
        return '{}'.format(self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__str__()

    @classmethod
    def create_attendee(cls, user, event, status):
        return cls.objects.create(
            user=user,
            event=event,
            status=False,
        )

    @classmethod
    def create_attendee_status(cls, event, user, status=False):
        obj, _ = cls.objects.get_or_create(event=event, user=user)
        obj.status = status
        obj.save() 
        return obj
