from django.contrib.auth.models import User

from ispa_app.tests import BaseTestCase

from events import models


class TestEventViews(BaseTestCase):

    def setUp(self):
        super(TestEventViews, self).setUp()
        # Sample event
        self.event = models.Event.create_event(**self.default_event_kwargs)
