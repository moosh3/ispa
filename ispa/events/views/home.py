from django.contrib.auth.decorators import login_required
from django.views.generic import View

class EventDashboard(View):
    template_name = 'event_list.html'
    model = Event
    slug_url_kwarg = 'event_slug'

    @login_required
    def dispatch(self, *args, **kwargs):
        return super(EventList, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        context['active_events'] = models.Events.objects.filter(
            is_active=True,
        )
        user_created_events = models.EventGuest.objects.filter(
            event=self.event,
            user=self.request.user,
        ).order_by('-modified')[:5]
        context['update_events'] = models.Review.objects.filter(
            event=self.event
        ).order_by('-modified')[:5]
        return context
