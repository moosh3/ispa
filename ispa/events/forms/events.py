from django import ModelForm

from events.models import Event


class EventForm(ModelForm):
    class Meta:
        model = Event
        fields = ['name', 'description', 'extended_description',
                  'image', 'location', 'date',
        ]
