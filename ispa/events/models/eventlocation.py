from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

from events.models.base import BaseModel


class EventLocation(BaseModel):

    address = models.CharField('Address', max_length=45, null=True, blank=True)
    address2 = models.CharField('Address 2', max_length=45, null=True,
                                blank=True)
    city = models.CharField('City', max_length=45, null=True, blank=True)
    state = models.CharField('State', max_length=45, null=True, blank=True)
    zipcode = models.CharField('Zipcode', max_length=10, null=True, blank=True)

    def __str__(self):
        return '{}'.format(self.address)

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_location(cls, address, address2, city, state, zipcode):
        return cls.objects.create(
            address=address,
            address2=address2,
            city=city,
            state=state,
            zipcode=zipcode,
        )

    def to_json(self):
        return {
            'address': self.address,
            'address2': self.address2,
            'city': self.city,
            'state': self.state,
            'zipcode': self.zipcode,
        }
