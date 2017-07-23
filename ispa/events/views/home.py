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
