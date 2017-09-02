from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import DetailView, UpdateView, ListView, TemplateView
from django.utils.decorators import method_decorator
from django.contrib.auth.models import User
from django import forms

from events.models import UserProfile, Attendance
from events.forms import UserFilterForm

class DetailUserView(TemplateView):

    template_name = 'users/profile.html'  # That's All Folks!
    model = User

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.member = get_object_or_404(
            UserProfile,
            user=self.kwargs['user']
        )
        return super(DetailUserView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(DetailUserView, self).get_context_data(**kwargs)
        context['rsvp_events'] = Attendance.objects.filter(
            user=self.member.user,
        )
        return context

class EditUserView(UpdateView):
    template_name = 'users/userprofile_form.html'
    model = UserProfile
    fields = ['avatar', 'bio', 'phone_number', 'year',
             'tshirt', 'first_name', 'last_name']

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        self.user = get_object_or_404(
            UserProfile,
            pk=self.kwargs['pk']
        )

        return super(EditUserView, self).dispatch(*args, **kwargs)

class ListUserView(ListView):
    template_name = 'users/list.html'
    paginate_by = 10
    model = UserProfile

    def __init__(self, *args, **kwargs):
        self.members = UserProfile.objects.all()
        super(ListUserView, self).__init__(*args, **kwargs)

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(ListUserView, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(ListUserView, self).get_context_data(**kwargs)
        return context

list_view = ListUserView.as_view()
detail_view = DetailUserView.as_view()
update_view = EditUserView.as_view()
