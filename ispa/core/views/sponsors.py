from django.views.generic import CreateView, ListView

from core.models import Sponsor

class CreateSponsorView(CreateView):

    model = Sponsor
    fields = '__all__'
    success_url = '/events/'


class ListSponsorView(ListView):

    model = Sponsor


create_view = CreateSponsorView.as_view()
list_view = ListSponsorView.as_view()
