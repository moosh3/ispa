<<<<<<< HEAD
from django.views.generic import View

from events.models import Event

class EventDashboard(View):
    template_name = 'home.html'
    model = Event

    def dispatch(self, *args, **kwargs):
        return super(EventDashboard, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        context['active_events'] = models.Events.objects.filter(
            is_active=True,
        )
        user_created_events = models.EventGuest.objects.filter(
            event=self.event,
            guest=self.request.user,
        ).order_by('-modified')[:5]
        return context
=======
from django.views.generic import FormView

from events.models import Event, EventGuest

class EventDashboard(FormView):
    template_name = 'dashboard.html'

    def dispatch(self, *args, **kwargs):
        return super(EventDashboard, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        context['active_events'] = Event.objects.filter(
            is_active=True,
        )
        user_created_events = EventGuest.objects.filter(
            guest=self.request.user,
        ).order_by('-modified')[:5]
        context['users_events'] = user_created_events

        return context

    def form_valid(self, form):
        # This method is called when valid form data has been POSTed.
        # It should return an HttpResponse.
        return super(EventDashboard, self).form_valid(form)
>>>>>>> 545c833f37e5ce15bfa5d5fc2a01af6a04b9635f
