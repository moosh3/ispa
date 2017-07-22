from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

class Event(models.Model):
    
    event_id = models.IntegerField(max_length=6)
    owner = models.ForeignKey('User', null=True)
    creation_date = models.DateField('Event Creation Date', auto_add=True)
    address = models.CharField('Address', max_length=45, null=True, blank=True)
    address2 = models.Charfield('Address 2', max_length=45, null=True, blank=True)
    city = models.CharField('City', max_length=45, null=True, blank=True)
    state = models.CharField('State', verbose_name='State', max_length=45, null=True, blank=True)
    zipcode = models.CharField('Zipcode', max_length=10, null=True, blank=True)
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True) 

    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'
