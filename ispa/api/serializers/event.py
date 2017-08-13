from rest_framework import serializers

from .attendees import AttendeeSerializer

from events.models import Event


class EventSerializer(serializers.ModelSerializer):

    # M2M relationship with attendees
    attendees = AttendeeSerializer(source='event', read_only=True, many=True)

    class Meta:
        model = Event
        fields = '__all__'
