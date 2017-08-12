from django.contrib.auth.decorators import login_required
from django.views.generic.detail import SingleObjectMixin
from django.views.generic import TemplateView, UpdateView, CreateView, ListView
from django.utils.decorators import method_decorator
from django.contrib.auth.models import User
from events.models import UserProfile


class DetailUserView(TemplateView):
    template_name = 'users/profile.html'  # That's All Folks!
    model = User

class EditUserView(CreateView):
    model = UserProfile
    fields = '__all__'

class ListUserView(ListView):
    model = UserProfile

list_view = ListUserView.as_view()
detail_view = DetailUserView.as_view()
update_view = EditUserView.as_view()
