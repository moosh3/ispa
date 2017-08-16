from django.db import models
from django.views.generic import CreateView, ListView, DetailView

from events import models


class CreateSpeakerView(CreateView):

    model = models.Speaker
    fields = '__all__'
    success_url = '/events/'


class ListSpeakerView(ListView):

    model = models.Speaker


class DetailSpeakerView(DetailView):

    template_name = 'speakers/detail.html'
    model = models.Speaker

    def __init__(self, *args, **kwargs):
        super(De)
        self.user = None
        self.speaker = None

    def dispatch(self, *args, **kwargs):
        self.speaker = get_object_or_404(
            models.Speaker,
            slug=self.kwargs['slug']
        )
        return super(DetailSpeakerView, self).dispatch(*args, **kwargs)



detail_view = DetailSpeakerView.as_view()
create_view = CreateSpeakerView.as_view()
list_view = ListSpeakerView.as_view()
