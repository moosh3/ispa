from django.contrib.auth.models import User

from ispa_app.tests import BaseTestCase

from events import models


class TestGroupModel(BaseTestCase):

    def test_create_event(self):
        self.assertEqual(self.event.name, 'Test Event')
        self.assertEqual(self.event.__str__(), 'Event: Test Event')

    def test_add_member_to_event(self):
        self.event.guests.add(self.user)
        self.assertEqual(self.event.guests.count(), 1)

    def test_create_event_location(self):
        self.assertEqual(self.location.address, '1234 Main St.')
        self.assertEqual(
            self.location.__str__(),
            'EventLocation: 1234 Main St.'
        )
