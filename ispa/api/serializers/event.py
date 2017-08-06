from rest_framework import serializers

from events.models import Event

class EventSerializer(serializers.ModelSerializer):
    owners = serializers.ReadOnlyField(source='owners.user.username')

    class Meta:
        model = Event
        fields = ('location', 'slug', 'owners', 'attendees', 'date',
                  'description', 'is_active', 'name', 'points', 'event_type')
