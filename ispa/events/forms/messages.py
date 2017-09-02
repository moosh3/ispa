from django import forms

from events.models import Message, Event


class EventMessageForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        event = kwargs.pop('event', None)
        super(EventMessageForm, self).__init__(*args, **kwargs)
        if event:
            self.fields['event'].initial = event
        if user:
            self.fields['user'].initial = user

    class Meta:
        model = Message
        fields = '__all__'
        widgets = {
            'user': forms.HiddenInput(),
            'event': forms.HiddenInput(),
        }
