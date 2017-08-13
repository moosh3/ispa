from django.db import models
from django.views.generic import CreateView, ListView

from events import models


class CreateSpeakerView(CreateView):

    model = models.Speaker
    fields = '__all__'
    success_url = '/events/'


class ListSpeakerView(ListView):

    model = models.Speaker


create_view = CreateSpeakerView.as_view()
list_view = ListSpeakerView.as_view()
