from __future__ import unicode_literals

from django.utils.encoding import python_2_unicode_compatible
from django.db import models

from events.models import BaseModel


@python_2_unicode_compatible
class Message(BaseModel):

    user = models.ForeignKey('auth.User', related_name='messages',)
    events = models.ForeignKey('Event')
    text = models.CharField(max_length=1028, blank=True, null=True)

    def get_absolute_url(self):
        return reverse('message', args=[self.title])

    def __str__(self):
        return '{}'.format(self.text)

    @property
    def title(self):
        return self.__str__()

    @classmethod
    def create_message(cls, user, event, text):
        return cls.objects.create(
            user=user,
            event=event,
            text=text,
        )
