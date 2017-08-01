from django.contrib.auth.models import User


from ispa_app import models
from ispa_app.tests import BaseTestCase

class TestMemberProxy(BaseTestCase):

    def test_create_user_member(self):
        models.Member.objects.all().delete()
        user_member = models.Member.create_user_member(
            user=self.user,
            points=4,
            bio='',
        )
        self.assertEqual(user_member.user, self.user)
