from django import forms

from events.models import UserProfile


class UserFilterForm(forms.Form):

    SORT_OPTIONS = (
        ('', '-----------'),
        ('newest', 'Newest'),
        ('oldest', 'Oldest'),
    )

    title = forms.CharField(required=False, label='keyword')
    sort_by = forms.ChoiceField(
        required=False,
        choices=SORT_OPTIONS,
    )

    def __init__(self, members, *args, **kwargs):
        super(UserFilterForm, self).__init__(*args, **kwargs)

    def return_members(self, initial_qs=None):
        if self.errors:
            return UserProfile.objects.none()

        qs = models.UserProfile.objects.all() if not initial_qs else initial_qs

        data = self.cleaned_data
        if data.get('sort_by'):
            sorting = data['sort_by']
            if sorting == 'newest':
                qs = qs.order_by('-modified')
            elif sorting == 'oldest':
                qs = qs.order_by('modified')

        return qs.distinct()
