from django import forms

from events.models import Event, Attendance


class EventForm(forms.ModelForm):
    class Meta:
        model = Event
        fields = ['name', 'description', 'extended_description',
                  'image', 'location', 'date',
        ]

class RsvpForm(forms.ModelForm):
    class Meta:
        model = Attendance
        fields = ['user', 'event', 'attending']
        widgets = {
            'user': forms.HiddenInput(),
            'event': forms.HiddenInput()
        }
