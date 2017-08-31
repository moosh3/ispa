from rest_framework import serializers

from events.models import EventLocation

class EventLocationSerializer(serializers.ModelSerializer):
    class Meta: # pylint: disable=C1001
        model = EventLocation
        fields = ('id','address', 'address2', 'city', 'state', 'zipcode')
