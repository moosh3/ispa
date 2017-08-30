from __future__ import unicode_literals

from django.utils.encoding import python_2_unicode_compatible
from django.db import models

from events.models.base import BaseModel


@python_2_unicode_compatible
class EventLocation(BaseModel):

    address = models.CharField('Address', max_length=45, null=True, blank=True)
    address2 = models.CharField('Address 2', max_length=45, null=True,
                                blank=True)
    city = models.CharField('City', max_length=45, null=True, blank=True)
    state = models.CharField('State', max_length=45, null=True, blank=True)
    zipcode = models.CharField('Zipcode', max_length=10, null=True, blank=True)

    def __str__(self):
        return '{}'.format(self.address)

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
