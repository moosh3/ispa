from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import DetailView, UpdateView, ListView
from django.utils.decorators import method_decorator
from django.contrib.auth.models import User
from django import forms

from events.models import UserProfile, Attendance
from events.forms import UserFilterForm


class DetailUserView(DetailView):
    template_name = 'users/profile.html'  # That's All Folks!
    model = UserProfile

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        self.lookup_args = kwargs

        return super(DetailUserView, self).dispatch(*args, **kwargs)

    def get_object(self, *args, **kwargs):
        lookup_dict = {}
        if self.lookup_args.get('pk'):
            lookup_dict['pk'] = self.lookup_args['pk']
        if self.lookup_args.get('username'):
            lookup_dict['user__username'] = self.lookup_args['username'].lower()

        return get_object_or_404(
            UserProfile,
            **lookup_dict
        )

    def get_context_data(self, **kwargs):
        context = super(DetailUserView, self).get_context_data(**kwargs)
        obj = self.get_object()
        context['rsvp_events'] = Attendance.objects.filter(
            user=obj.user,
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
