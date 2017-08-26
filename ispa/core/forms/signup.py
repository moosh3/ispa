from django import forms
from events.models import UserProfile

class SignupForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, label='First name:')
    last_name = forms.CharField(max_length=30, label='Last name:')

    class Meta:
        model = UserProfile
        fields = ('phone_number',)

    def signup(self, request, user):
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.save()
