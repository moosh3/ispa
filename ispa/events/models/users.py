import os

from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from events.models.base import BaseModel

def avatar_field(instance, filename):
    return os.path.join('users', str(instance.user.pk), filename)

class UserProfile(BaseModel):

    USER = 'user'
    SYSTEM = 'system'

    USER_TYPE_CHOICES = (
        (USER, USER.capitalize()),
        (SYSTEM, SYSTEM.capitalize())
    )

    user = models.OneToOneField('auth.User')
    avatar = models.ImageField(upload_to=avatar_field, null=True, blank=True)
    bio = models.TextField(blank=True, null=True)
    user_type = models.CharField(
        max_length=1024,
        choices=USER_TYPE_CHOICES,
        default=USER,
    )

    def __str__(self):
        return '{}'.format(self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__unicode__()

    def get_absolute_url(self):
        return reverse('profile', args=[self.user.username])


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.get_or_create(user=instance)
