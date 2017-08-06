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
        return 'Owner: {} of {}'.format(
            self.user.username,
            self.event.name,
        )

    def __unicode__(self):
        return __str__()

    def to_json(self):
        return {
            'user': self.user.username,
            'event': self.event.to_json(),
            'is_active': self.is_active,
        }

    @classmethod
    def create_owner(cls, user, event, is_active):
        obj, created = cls.objects.get_or_create(
            user=user,
            event=event,
            is_active=is_active,
        )
        if not created and obj.is_active:
            # Already an active creator
            return obj, created

        if not obj.is_active:
            obj.is_active = True
            obj.save(update_fields=['is_active'])
