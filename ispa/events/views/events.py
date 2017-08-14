from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect
from django.views.generic import (
    TemplateView,
    DetailView,
    ListView,
    View,
    CreateView,
)

from events import models


class EventDashboard(TemplateView):
    template_name = 'events/home.html'

    def dispatch(self, *args, **kwargs):
        return super(EventDashboard, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        active_events = models.Event.objects.filter(
            is_active=True,
        ).order_by('-name')[:5]
        context['active_events'] = active_events

        return context


class EventDetailView(DetailView):

    template_name = 'events/detail.html'
    model = models.Event

    def __init__(self, *args, **kwargs):
        super(EventDetailView, self).__init__(*args, **kwargs)
        self.event = None
        self.user = None

    def dispatch(self, *args, **kwargs):
        self.event = get_object_or_404(
            models.Event,
            slug=self.kwargs['slug']
        )
        return super(EventDetailView, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDetailView, self).get_context_data(**kwargs)
        try:
            creator = models.Attendance.objects.get(
                event=self.event,
                user=self.user,
                is_owner=True
            )
            context['creator'] = creator
        except models.Attendance.DoesNotExist:
            creator = None

        context['event'] = self.event
        return context

class EditEventView(TemplateView):

    template_name = ''

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = None
        self.event_inst = None
        self.event_form = None

    def dispatch(self, request, *args, **kwargs):
        self.event_inst = get_object_or_404(models.Event, pk=kwargs['pk'])
        self.template_name = 'events/edit_event.html'
        return super(EditEventView, self).dispatch(request, *args, **kwargs)

    def post(self, request, pk=None, *args, **kwargs):
        pass


class EventListView(ListView):

    model = models.Event

    @login_required
    def dispatch(self, request, *args, **kwargs):
        return super(EventList, self).dispatch(request, *args, **kwargs)


class CreateEventView(CreateView):

    model = models.Event
    fields = '__all__'
    success_url = '/events/'


dashboard_view = EventDashboard.as_view()
detail_view = EventDetailView.as_view()
create_view = CreateEventView.as_view()
edit_view = EditEventView.as_view()
list_view = EventListView.as_view()
