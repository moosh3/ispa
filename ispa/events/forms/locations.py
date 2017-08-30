from django import forms

from events.models import EventLocation

class LocationForm(forms.ModelForm):
    class Meta:
        model = EventLocation
        fields = '__all__'
