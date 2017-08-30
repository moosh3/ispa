from django import forms
from events.models import UserProfile

class SignupForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ('phone_number', 'tshirt')
        placeholders = {'username': "firstname.lastname", 'phone_number': "Phone number"}

    def signup(self, request, user):
        user.save()
