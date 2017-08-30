from rest_framework import serializers

from events.models import UserProfile

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta: # pylint: disable=C1001
        model = UserProfile
        fields = '__all__'
