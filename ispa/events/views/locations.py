from django.db import models
from django.views.generic import CreateView

from events.models import EventLocation


class CreateLocationView(CreateView):

    model = EventLocation
    fields = '__all__'
    success_url = '/events/'


create_view = CreateLocationView.as_view()
