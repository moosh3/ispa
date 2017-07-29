from django.views.generic import ListView, DetailView
from django.contrib.auth.decorators import login_required

from events.models import Event

class EventList(ListView):

    model = Event

    def dispatch(self, request, *args, **kwargs):
        return super(EventList, self).dispatch(request, *args, **kwargs)

        events = Event.objects.filter(
            event=self.event,
        )


class EventHistory(DetailView):

    model = Event

    def dispatch(self, *args, **kwargs):
        return super(EventHistory, self).dispatch(*args, **kwargs)
