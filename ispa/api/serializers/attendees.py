from rest_framework import serializers

from events.models import Attendance

class AttendeeSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    event = serializers.StringRelatedField()

    class Meta: # pylint: disable=C1001
        model = Attendance
        fields = ('id', 'user', 'event', 'is_owner')
