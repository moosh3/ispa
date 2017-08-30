from django.db import models
from django.views.generic import CreateView, ListView, DetailView

from events.models import Message


class DetailMessageView(DetailView):

    template_name = 'includes/message.html'
    model = Message

    def __init__(self, *args, **kwargs):
        super(DetailMessageView)
        self.user = None
        self.event = None

    def get_context_data(self, *args, **kwargs):
        context = super(DetailMessageView, self).get_context_data(*args, **kwargs)
        try:
            message = Message.obejcts.filter(
                event=self.event,
                user=self.user
            )
            context['message'] = message
        except Message.DoesNotExist:
            message = None

        context['event'] = event
        return context

detail_view = DetailMessageView.as_view()
