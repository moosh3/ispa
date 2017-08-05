from events.tests import BaseTestCase
from events import models
from . import factories


class TestUserModel(BaseTestCase):

    def setUp(self):
        self.user = factories.UserFactory.create()

    def test_create_user_status(self):
        pass

    def test_create_user_status_true(self):
        status = factories.AttendeeeFactory.create()
        self.assertTrue(status.did_attend)

    def test_absolute_url(self):
        self.assertEqual(self.user.userprofile.get_absolute_url,
            '/accounts/profile/{}/'.format(self.user.username)
        )
