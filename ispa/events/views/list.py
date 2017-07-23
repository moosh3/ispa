from django.views.generic import ListView
from events.models import Event

class EventList(ListView):

    model = Event
