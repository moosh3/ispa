from django.views.generic import DetailView
from events.models import Event

class EventDetail(DetailView):

    model = Event

    def get_context_data(self, **kwargs):
        # Call the base implementation first to get a context
        context = super(EventDetail, self).get_context_data(**kwargs)
        # Add in a QuerySet of all the books
        context['event_list'] = Event.objects.all()
        return context
