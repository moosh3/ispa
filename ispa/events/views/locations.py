from django.db import models
from django.views.generic import CreateView

from events import models


class CreateLocationView(CreateView):

    model = models.EventLocation
    fields = '__all__'
    success_url = '/events/'


create_view = CreateLocationView.as_view()
