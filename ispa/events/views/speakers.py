from django.db import models
from django.views.generic import CreateView, ListView, DetailView

from events.models import Speaker


class CreateSpeakerView(CreateView):

    model = Speaker
    fields = '__all__'
    success_url = '/events/'


class ListSpeakerView(ListView):

    model = Speaker


class DetailSpeakerView(DetailView):

    template_name = 'speakers/detail.html'
    model = Speaker

    def __init__(self, *args, **kwargs):
        super(De)
        self.user = None
        self.speaker = None

    def dispatch(self, *args, **kwargs):
        self.speaker = get_object_or_404(
            Speaker,
            slug=self.kwargs['slug']
        )
        return super(DetailSpeakerView, self).dispatch(*args, **kwargs)



detail_view = DetailSpeakerView.as_view()
create_view = CreateSpeakerView.as_view()
list_view = ListSpeakerView.as_view()
