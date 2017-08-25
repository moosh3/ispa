from django.db import models
from django.views.generic import CreateView, ListView


class CreateSponsorView(CreateView):

    model = models.Sponsor
    fields = '__all__'
    success_url = '/events/'


class ListSponsorView(ListView):

    model = models.Sponsor


create_view = CreateSponsorView.as_view()
list_view = ListSponsorView.as_view()
