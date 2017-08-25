from rest_framework import serializers

from events.models import Speaker

class SpeakerSerializer(serializers.ModelSerializer):
    class Meta: # pylint: disable=C1001
        model = Speaker
        fields = '__all__'
