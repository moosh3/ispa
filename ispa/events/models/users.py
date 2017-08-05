import os

from django.db import models
from django.contrib.auth.models import User
fron django.core.urlresolvers import reverse

from events.models.base import BaseModel
from events.models import Owner, Event


def avatar_field(instance, filename):
    return os.path.join('users', str(instance.user.pk), filename)


class UserProxy(User):

    def is_guest(self, event):
        guest_list = User.objects.filter(
            models.Q(owner__event=event) |
            models.Q(attendance__event=event)
        ).distinct()
        return guest_list.filter(pk=self.pk).exists()

    @property
    def events(self):
        return Event.objects.active().filter(
            models.Q(event__attendee__user=self) |
            models.Q(event__owner__user=self
        ).distinct()

    class Meta:
        proxy = True


class UserProfile(BaseModel):

    USER = 'user'
    SYSTEM = 'system'

    USER_TYPE_CHOICES = (
        (USER, USER.capitalize()),
        (SYSTEM, SYSTEM.capitalize())
    )

    user = models.OneToOneField('auth.User')
    avatar = models.ImageField(upload_to=avatar_field, null=True, blank=True)
    bio = models.TextField(blank=True)
    user_type = models.CharField(
        max_length=1024,
        choices=USER_TYPE_CHOICES,
        default=USER,
    )

    def __str__(self):
        return '{}'.format(self.display_name or self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__unicode__()

    def get_absolute_url(self):
        return reverse('profile', args=[self.user.username])
