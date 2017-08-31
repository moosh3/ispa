from __future__ import unicode_literals

from django.utils.encoding import python_2_unicode_compatible
from django.db import models


@python_2_unicode_compatible
class Rsvp(models.Model):

    member = models.ForeignKey('UserProfile')
    event = models.ForeignKey('Event')
    rsvp = models.BooleanField(default=False)

    def __str__(self):
        return '{}'.format(self.member.user.username)

    @property
    def name(self):
        return self.__str__()

    @classmethod
    def create_rsvp(cls, user, event, attending, is_owner):
        return cls.objects.create(
            user=user,
            event=event,
            attending=attending,
            is_owner=is_owner,
        )
