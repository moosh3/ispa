from __future__ import unicode_literals
import os

from django.utils.encoding import python_2_unicode_compatible
from django.db import models
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.validators import RegexValidator

from events.models.base import BaseModel

def avatar_field(instance, filename):
    return os.path.join('events', 'static', 'users', str(instance.user.pk), filename)


@python_2_unicode_compatible
class UserProfile(BaseModel):

    USER = 'user'
    SYSTEM = 'system'

    YEAR_CHOICES = (
        ('FR', 'Freshman'),
        ('SM', 'Sophmore'),
        ('JR', 'Junior'),
        ('SR', 'Senior')
    )

    SHIRT_SIZES = (
        ('S', 'Small'),
        ('M', 'Medium'),
        ('L', 'Large'),
        ('XL', 'Extra Large')
    )

    USER_TYPE_CHOICES = (
        (USER, USER.capitalize()),
        (SYSTEM, SYSTEM.capitalize())
    )

    user = models.OneToOneField('auth.User')
    first_name = models.CharField(max_length=128, blank=True, null=True)
    last_name = models.CharField(max_length=128, blank=True, null=True)
    avatar = models.ImageField(upload_to=avatar_field, null=True, blank=True)
    bio = models.TextField(blank=True, null=True)
    phone_number = models.CharField(max_length=12, null=True, blank=True)
    dues_paid = models.BooleanField(default=False)
    points = models.PositiveIntegerField(blank=True, null=True)
    year = models.CharField(max_length=56, choices=YEAR_CHOICES, default='FR')
    tshirt = models.CharField(max_length=56, choices=SHIRT_SIZES, default='M')
    def __str__(self):
        return '{}'.format(self.user.username)

    @property
    def name(self):
        return self.__unicode__()

    def get_absolute_url(self):
        return reverse('profile', args=[self.user.username])


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.get_or_create(user=instance)
