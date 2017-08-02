from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect
from django.views.generic import (
    TemplateView, DetailView, ListView, View
)

from events import models


class EventDashboard(TemplateView):
    template_name = 'dashboard.html'

    def dispatch(self, *args, **kwargs):
        return super(EventDashboard, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        context['active_events'] = models.Event.objects.filter(
            is_active=True,
        ).order_by('-name')[:5]

        return context


class EventDetailView(DetailView):

    model = models.Event

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = None
        self.user = None

    def dispatch(self, *args, **kwargs):
        self.event = get_object_or_404(
            models.Event,
            name=self.kwargs['event_slug']
        )
        return super(EventDetail, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDetail, self).get_context_data(**kwargs)
        try:
            owners = models.Owner.objects.get(
                event=self.event,
                user=self.user,
                is_active=True
            )
        except models.Owner.DoesNotExist:
            owner = None
        if owners:
            context['owners'] = owners

        context['event'] = self.event
        return context


class CreateEventView(View):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = None

    @login_required
    def dispatch(self, request, *args, **kwargs):
        self.event = get_object_or_404(
            models.Event,
            name=kwargs['name']
        )
        return super(CreateEventView).dispatch(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        event = models.Event.create(
            location=[],
            creator=[request.user],
            guests=[],
            date='',
            description='',
            is_active=True,
            name='',
            points=[],
            eventtype=[],
        )
        return redirect('edit-event', event_name=self.event.name, pk=event.pk)


class EditEventView(TemplateView):

    template_name = ''

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = None
        self.event_inst = None
        self.event_form = None

    @login_required
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


dashboard_view = EventDashboard.as_view()
detail_view = EventDetailView.as_view()
create_view = CreateEventView.as_view()
edit_view = EditEventView.as_view()
list_view = EventListView.as_view()
