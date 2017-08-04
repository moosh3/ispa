from django.db import models
from django.contrib.auth.models import User


class Member(models.Model):

    user = models.OneToOneField('auth.User')
    event = models.ForeignKey('Event')
    points = models.IntegerField()
    bio = models.CharField(max_length=1000, blank=True)

    def __str__(self):
        return '{}'.format(self.user.username)

    def __unicode__(self):
        return __str__()

    @property
    def name(self):
        return self.__str__()

    @classmethod
    def create_user_member(cls, user, points, bio):
        return cls.objects.create(
            user=user,
            points=points,
            bio=bio,
        )
