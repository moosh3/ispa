from django.contrib.auth.decorators import login_required
from django.views.generic.detail import SingleObjectMixin
from django.views.generic import TemplateView, UpdateView, CreateView
from django.utils.decorators import method_decorator

from events.models import UserProfile


class DetailUserView(TemplateView):
    template_name = 'users/profile.html'  # That's All Folks!
    model = UserProfile

class EditUserView(CreateView):
    model = UserProfile
    fields = '__all__'


detail_view = DetailUserView.as_view()
update_view = EditUserView.as_view()
