import datetime

from django.test import TestCase
from django.contrib.auth.models import User

from ispa_app import models
from events import models as emodels


class BaseTestCase(TestCase):

    def setUp(self):
        self.user = User.objects.create(username='test_user')
        self.user.set_password('justtestit')
        self.user.email = 'test_user@example.com'
        self.user.save()

        self.location = emodels.EventLocation.objects.create(
            address='1234 Main St.',
            address2='Apt 2',
            city='Chicago',
            state='IL',
            zipcode='60660',
        )
        self.location.save()

        for count in range(0, 3):
            u = User.objects.create(username='test_member_{}'.format(count))
            u.set_password('justtestit')
            u.email = '{}@example.com'.format(u.username)
            u.save()
            models.Member.objects.create(user=u, points=1, bio='')

        for count in range(0, 3):
            u = User.objects.create(username='test_user_{}'.format(count))
            u.set_password('justtestit')
            u.email = '{}@example.com'.format(u.username)
            u.save()

        self.test_users = User.objects.filter(
            username__startswith='test_user_',
        )
        self.test_members = User.objects.filter(
            username__startswith='test_member_',
        )

        self.default_event_kwargs = {
            'name'='Test Event',
            'description'='Test Event at 1234 Main St.',
            'creator'=self.user,
            'location'=self.location,
            'guests'=self.test_members,
            'date'=datetime.datetime.now(),
            'points'=5,
            'is_active'=True,
            'eventtype'='EVENT'
        }
