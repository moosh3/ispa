from django.db import models
from django.views.generic import CreateView, ListView

from events.models import Announcement


class CreateAnnouncementView(CreateView):

    model = Announcement
    fields = '__all__'
    success_url = '/events/'


class ListAnnouncementView(ListView):

    model = Announcement


create_view = CreateAnnouncementView.as_view()
list_view = ListAnnouncementView.as_view()
