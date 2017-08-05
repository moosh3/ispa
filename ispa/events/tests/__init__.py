import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from events import models as models

from .factories import (
    UserFactory,
    EventFactory,
    EventLocationFactory,
    AttendeeFactory,
    OwnerFactory,
    AttendeeWithEventFactory,
    OwnerWithEventFactory
)


class SymbolDict(object):
  def __init__(self, **kwargs):
    for key in kwargs:
      setattr(self, key, kwargs[key])


class BaseTestCase(TestCase):

    def setUp(self):

        self.user = User.objects.create(username='test_user')
        self.user.set_password('justtestit')
        self.user.email = 'test_user@example.com'
        self.user.save()

        self.location = models.EventLocation.objects.create(
            address='1234 Main St.',
            address2='Apt 2',
            city='Chicago',
            state='IL',
            zipcode='60660',
        )
        self.location.save()

        for count in range(0, 3):
            u = User.objects.create(username='test_user_{}'.format(count))
            u.set_password('justtestit')
            u.email = '{}@example.com'.format(u.username)
            u.save()

        self.test_users = User.objects.filter(
            username__startswith='test_user_',
        )

        self.default_event_kwargs = {
            'name': 'Test Event',
            'description': 'Test Event at 1234 Main St.',
            'owners': self.user,
            'location': self.location,
            'guests': self.test_users,
            'date': datetime.date(2017, 12, 5),
            'points': 5,
            'is_active': True,
            'event_type': 'EVENT',
            'slug': 'test-event'
        }

        self.default_event_location_kwargs = {
            'address': '1234 Main St.',
            'address2': 'Unit 3',
            'city': 'Chicago',
            'state': 'IL',
            'zipcode': '60660',
        }
