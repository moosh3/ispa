from django import ModelForm
from django.contrib.auth.models import User
from events import models


ATTENDING_CHOICES = (
    ('yes', 'Yes'),
    ('no', 'No'),
    ('maybe', 'Maybe'),
)

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

class RSVPForm(forms.Form):
    attending = forms.ChoiceField(choices=ATTENDING_CHOICES, initial='no', widget=forms.RadioSelect)
    email = forms.CharField()

    def __init__(self, *args, **kwargs):
        super(RSVPForm, self).__init__(*args, **kwargs)

    def save(self):
        models.Attendance = self.User.objects.get(email=self.cleaned_data['email'])

        Attendance.attending_status = self.cleaned_data['attending']
        Attendance.save()
        return Attendance
