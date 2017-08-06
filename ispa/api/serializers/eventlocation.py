from rest_framework import serializers

from events.models import EventLocation

class EventLocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = EventLocation
        fields = ('address', 'address2', 'city', 'state', 'zipcode')
