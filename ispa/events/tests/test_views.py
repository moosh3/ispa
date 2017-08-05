from django.contrib.auth.models import User

from . import BaseTestCase
from events import models


class TestEventViews(BaseTestCase):

    def setUp(self):
        # Sample event
        self.event = models.Event.create_event(**self.default_event_kwargs)
