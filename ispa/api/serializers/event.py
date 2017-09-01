from rest_framework import serializers

from .attendees import AttendeeSerializer

from events.models import Event


class EventSerializer(serializers.ModelSerializer):

    # M2M relationship with attendees
    attendees = AttendeeSerializer(many=True, read_only=True)

    class Meta: # pylint: disable=C1001
        model = Event
        fields = ('id', 'name', 'points', 'description', 'extended_description', 'location',
                 'date', 'attendees',)
