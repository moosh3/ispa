from django.contrib.auth.decorators import login_required
from django.views.generic.detail import SingleObjectMixin
from django.views.generic import TemplateView, UpdateView
from django.utils.decorators import method_decorator

from events.models import UserProfile


class ProfileDetailView(TemplateView):
    """
    A view that displays a form for editing a user's profile.

    Uses a form dynamically created for the `Profile` model and
    the default model's update template.
    """
    template_name = 'users/profile.html'  # That's All Folks!


    model = UserProfile

class ProfileUpdateView(UpdateView):
    """
    A view that displays a form for editing a user's profile.

    Uses a form dynamically created for the `Profile` model and
    the default model's update template.
    """
    template_name_suffix = '_edit_form'  # That's All Folks!

    fields = ['bio']
    model = UserProfile


detail_view = ProfileDetailView.as_view()
update_view = ProfileUpdateView.as_view()
