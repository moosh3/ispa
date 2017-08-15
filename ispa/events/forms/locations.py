from django import ModelForm
from events import models

class LocationForm(ModelForm):
    class Meta:
        model = models.EventLocation
        fields = '__all__'
