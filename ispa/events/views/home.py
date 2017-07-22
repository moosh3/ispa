from django.views.generic import TemplateView

class EventList(TemplateView):
    
    template_name = 'event_list.html'
    model = Event
