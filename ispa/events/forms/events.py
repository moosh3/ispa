from django import ModelForm
from events import models

class EventForm(ModelForm):
    class Meta:
        model = models.Event
        fields = ['name', 'description', 'extended_description',
                  'image', 'location', 'date',
        ]


class EventForm(ModelForm):
    class Meta:
        model = models.EventLocation
        fields = '__all__'
