from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404
from django.views.generic import TemplateView, UpdateView, ListView
from django.utils.decorators import method_decorator
from django.contrib.auth.models import User

from events.models import UserProfile


class DetailUserView(TemplateView):
    template_name = 'users/profile.html'  # That's All Folks!

    def __init__(self, *args, **kwargs):
        super(DetailUserView, self).__init__(*args, **kwargs)
        self.user = None
        self.userprofile = None

    def dispatch(self, *args, **kwargs):
        self.user = get_object_or_404(
            User,
            username=self.kwargs['username']
        )
        return super(DetailUserView, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(DetailUserView, self).get_context_data(**kwargs)
        try:
            userprofile = UserProfile.objects.get(
                user=user,
            )
            context['userprofile'] = userprofile
        except:
            userprofile = None

        return context

class EditUserView(UpdateView):
    template_name = 'users/userprofile_form.html'
    model = UserProfile
    fields = ['avatar', 'bio', 'phone_number', 'year']

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

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(ReviewListView, self).dispatch(*args, **kwargs)

    def get_queryset(self):
        qs = super(ReviewListView, self).get_queryset()
        form = forms.ReviewFilterForm(
            self.request.user.projects,
            data=self.request.GET
        )
        if form.is_valid():
            return form.get_reviews(qs)

        return models.Review.objects.none()

    def get_context_data(self, **kwargs):
        context = super(ReviewListView, self).get_context_data(**kwargs)
        initial = self.request.GET.copy()
        initial['state'] = initial.get('state', models.reviews.OPEN)
        context.update({
            'form': forms.ReviewFilterForm(
                self.request.user.projects,
                initial=initial,
                data=self.request.GET
            )
        })
        return context

list_view = ListUserView.as_view()
detail_view = DetailUserView.as_view()
update_view = EditUserView.as_view()
