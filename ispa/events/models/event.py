from django.db import models
from django.conf import settings
from django.contrib.auth.models import User

from core.models import BaseModel

class EventManager(models.Manager):

    def active(self):
        return self.get_queryset().filter(is_active=True)


class Event(BaseModel):
    
    event_id = models.IntegerField()
    owner = models.ForeignKey('auth.User')
    guests = models.ManyToManyField('auth.User', through='EventGuest')
    creation_date = models.DateField('Event Creation Date') 
    title = models.CharField('Event Name', max_length=45, null=True, blank=True)
    slug = models.SlugField(unique=True)
    address = models.CharField('Address', max_length=45, null=True, blank=True)
    address2 = models.CharField('Address 2', max_length=45, null=True, blank=True)
    city = models.CharField('City', max_length=45, null=True, blank=True)
    state = models.CharField('State', max_length=45, null=True, blank=True)
    zipcode = models.CharField('Zipcode', max_length=10, null=True, blank=True)
    date = models.DateTimeField('Event Date', null=True, blank=True, auto_now=False)
    description = models.CharField('Description', max_length=512, null=True, blank=True) 
    is_active = models.BooleanField(deafult=True)

    def __str__(self):
        return 'EVENT {}'.format(self.event_id)

    def get_absolute_url(self):
        return reverse('event-detail', args=[self.slug])

    @classmethod
    def create_event(cls, owner, title, address, address2,
                     city, state, zipcode, date, description):

        return cls.object.create(
            owner=owner,
            title=title,
            address=address,
            address2=address2,
            city=city,
            state=state,
            zipcode=zipcode,
            date=date,
            description=description
        )

    class Meta:
        db_table = 'event'
        verbose_name = 'Events'
        app_label = 'events'
        get_latest_by = 'creation_datetime'
