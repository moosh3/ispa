from contextlib import contextmanager
from django.conf import settings
from django.test import TestCase

from .factories import UserFactory

class ScenarioTestCase(TestCase):
    @contextmanager
    def log_user(self, user=None):
        if user is not None:
            self.client.login(username=user.username, password='password')
        try:
            yield
        finally:
            if user is not None:
                self.client.logout()

    @classmethod
    def setUpTestData(cls):
        cls.user1 = UserFactory.create()
        # Add here more users if needed

    def setUp(self):
        self.no_user_logged_in_scenario = cls.log_user(None)
        self.user1_logged_in_scenario = cls.log_user(self.user1)
        # Add here any other scenario you'd like
