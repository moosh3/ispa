from django.db import models
from django.views.generic import CreateView, ListView

from events import models


class CreateAnnouncementView(CreateView):

    model = models.Annoncement
    fields = '__all__'
    success_url = '/events/'


class ListAnnouncementView(ListView):

    model = models.Annoncement


create_view = CreateAnnouncementView.as_view()
list_view = ListAnnouncementView.as_view()
