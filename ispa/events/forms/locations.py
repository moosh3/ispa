from django import ModelForm

from events.models import EventLocation

class LocationForm(ModelForm):
    class Meta:
        model = EventLocation
        fields = '__all__'
