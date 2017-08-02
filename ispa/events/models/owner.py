from django.db import models
from django.contrib.auth.models import User


class OwnerManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Owner(models.Model):

    user = models.ForeignKey('auth.User')
    event = models.ForeignKey('Event')
    is_active = models.BooleanField(default=True)

    objects = OwnerManager()

    def __str__(self):
        return 'Creator: {} - {}'.format(
            self.user.username,
            self.event.name,
        )

    @classmethod
    def create_creator(cls, user, event):
        obj, created = cls.objects.get_or_create(
            user=user,
            review=review,
            defaults={'is_active': True}
        )
        if not created and obj.is_active:
            # Already an active creator
            return obj, created

        if not obj.is_active:
            obj.is_active = True
            obj.save(update_fields=['is_active'])
