from django.views.generic import FormView

from events.models import Event

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
