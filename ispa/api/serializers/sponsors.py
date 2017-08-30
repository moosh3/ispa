from rest_framework import serializers

from core.models import Sponsor

class SponsorSerializer(serializers.ModelSerializer):
    class Meta: # pylint: disable=C1001
        model = Sponsor
        fields = '__all__'
