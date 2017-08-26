from django import forms
from events.models import UserProfile

class SignupForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ('phone_number', 'tshirt')
        help_texts = {'username': "firstname.lastname"}

    def signup(self, request, user):
        user.save()
