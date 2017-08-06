from rest_framework import serializers

from .attendees import AttendeeSerializer

from events.models import Event


class EventSerializer(serializers.ModelSerializer):

    # M2M relationship with attendees
    attendees = AttendeeSerializer(source='event', read_only=True, many=True)

    class Meta:
        model = Event
        fields = ('location', 'slug', 'attendees', 'date',
                  'description', 'is_active', 'name', 'points', 'event_type')
