from django.db import models
from django.views.generic import CreateView

from events import models


class CreateEventView(CreateView):

    model = models.EventLocation
    fields = '__all__'
    success_url = '/events/'


create_view = CreateEventView.as_view()
