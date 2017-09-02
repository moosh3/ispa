from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect
from django.utils.decorators import method_decorator
from django.views.generic import (
    TemplateView,
    DetailView,
    ListView,
    View,
    CreateView,
)

from events.models import Event, Attendance, Message, UserProfile
from events.forms import EventMessageForm, RsvpForm


class EventDashboard(TemplateView):
    template_name = 'events/home.html'

    @method_decorator(login_required)
    def dispatch(self, *args, **kwargs):
        return super(EventDashboard, self).dispatch(*args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(EventDashboard, self).get_context_data(**kwargs)
        active_events = Event.objects.filter(
            is_active=True,
        ).order_by('date').exclude(name__startswith='Speaker')[:10]
        context['active_events'] = active_events

        members = UserProfile.objects.all()
        context['members'] = members
        speakers = Event.objects.filter(
            name__startswith='Speaker'
        )
        context['speakers'] = speakers
        return context

class DetailEventView(TemplateView):

    template_name = 'events/detail.html'
    model = Event

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        self.user = self.request.user
        self.event = get_object_or_404(
            Event,
            slug=self.kwargs['slug']
        )
        return super(DetailEventView, self).dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        self.message_form = EventMessageForm(request.POST)
        if self.message_form.is_valid():
            message = self.message_form.save()
            return redirect('event-detail', slug=self.event.slug)

        return self.get(request, *args, **kwargs)


    def get_context_data(self, *args, **kwargs):
        context = super(DetailEventView, self).get_context_data(*args, **kwargs)
        context['message_form'] = EventMessageForm(
            event=self.event,
            user=self.user
        )
        context['event'] = self.event
        try:
            guests = Attendance.objects.filter(
                event=self.event
            )
            context['guests'] = guests
        except:
            self.guests = None
        messages = Message.objects.filter(
            event=self.event
        )
        context['messages'] = messages
        context['user'] = self.user

        return context


class EditEventView(TemplateView):

    template_name = ''

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event = None
        self.event_inst = None
        self.event_form = None

    def dispatch(self, request, *args, **kwargs):
        self.event_inst = get_object_or_404(Event, pk=kwargs['pk'])
        self.template_name = 'events/edit_event.html'
        return super(EditEventView, self).dispatch(request, *args, **kwargs)

    def post(self, request, pk=None, *args, **kwargs):
        pass


class ListEventView(ListView):

    model = Event

    @login_required
    def dispatch(self, request, *args, **kwargs):
        return super(ListEventView, self).dispatch(request, *args, **kwargs)


class CreateEventView(CreateView):

    model = Event
    fields = '__all__'
    success_url = '/events/'


class RsvpView(View):
    template_name='events/rsvp.html'

    def __init__(self, request, *args, **kwargs):
        super(RsvpView, self).__init__(request, *args, **kwargs)
        self.user = self.request.user
        self.event = kwargs.pop('event')

    def post(self, request, *args, **kwargs):
        self.rsvp_form = RsvpForm(request.POST)
        self.rsvp_form.save()
        return redirect('event-dashboard')

    def get(self, request, *args, **kwargs):
        attendance = Attendance.objects.create(
            user=self.user,
            event=self.event,
            attending=True
        )
        attendance.save()
        return redirect('event-dashboard')



rsvp_view = RsvpView.as_view()
dashboard_view = EventDashboard.as_view()
detail_view = DetailEventView.as_view()
create_view = CreateEventView.as_view()
edit_view = EditEventView.as_view()
list_view = ListEventView.as_view()
