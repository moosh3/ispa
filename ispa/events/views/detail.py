from django.views.generic import DetailView
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import get_object_or_404

from events.models import Event

class EventDetail(DetailView):

    model = Event
    status = 200
    paginate_by = 25

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.event =  None
        self.guest_list = None

    @login_required
    def dispatch(self, *args, **kwargs):
        self.event = get_object_or_404(
            models.Event,
            slug=self.kwargs['event_slug']
        )
        return super(EventDetail, self).dispatch(*args, **kwargs)

    def get(self, request, *args, **kwargs):
        json_data = {
            'errors': '',
            'status': 'success',
            'events': [],
        }
        events = Event.objects.filter(
            event=self.event,
        )
        # Form for filtering events
        form = forms.EventFilterForm(project=self.project, data=request.GET)
        if form.is_valid():
            data = form.cleaned_data
            if data.get('event'):
                events = events.filter(event=data['event'])
            if data.get('event_type'):
                events = events.filter(
                    event_type__in=data['event_type']
                )
            if data.get('exclude_type'):
                events = events.exclude(
                    event_type__in=data['exclude_type']
                )
        else:
            self.status = 400
            json_data['errors'] = form.errors
            return json_data

        paginator = Paginator(events, self.paginate_by)
        page = request.GET.get('page')
        try:
            events = paginator.page(page)
        except PageNotAnInteger:
            page = 1
            events = paginator.page(page)
        except EmptyPage:
            page = paginator.num_pages
            events = paginator.page(page)

        for event in events:
            json_data['events'].append(event.to_json())

        json_data['page'] = page
        json_data['page_count'] = paginator.num_pages
        json_data['count'] = paginator.count
        return json_data
