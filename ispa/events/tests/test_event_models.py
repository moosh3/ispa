from django.contrib.auth.models import User

from events.test import BaseTestCase
from events import models

class TestGroupModel(BaseTestCase):

    def setUp(self):
        super(TestGroupModel, self).setUp()

    def test_create_event(self):
        self.event = models.Event.create_event(**self.default_event_kwargs)
        self.assertEqual(self.event.name, 'Test Event')
        self.assertEqual(self.event.__str__(), 'Event: Test Event')

    def test_create_event_location(self):
        self.event = models.Event.create_event(**self.default_event_kwargs)
        self.assertEqual(self.location.address, '1234 Main St.')
        self.assertEqual(
            self.location.__str__(),
            'EventLocation: 1234 Main St.'
        )
