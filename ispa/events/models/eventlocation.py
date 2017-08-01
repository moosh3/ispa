from django.db import models
from django.conf import settings
from django.contrib.auth.models import User


class EventLocation(models.Model):

    address = models.CharField('Address', max_length=45, null=True, blank=True)
    address2 = models.CharField('Address 2', max_length=45, null=True, blank=True)
    city = models.CharField('City', max_length=45, null=True, blank=True)
    state = models.CharField('State', max_length=45, null=True, blank=True)
    zipcode = models.CharField('Zipcode', max_length=10, null=True, blank=True)

    def __str__(self):
        return 'EventLocation: {}'.format(self.address)

    def __unicode__(self):
        return __str__()
