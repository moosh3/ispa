from rest_framework import viewsets

from api.serializers import EventSerializer
from events.models import Event


class EventViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.
    """
    queryset = Event.objects.all()
    serializer_class = EventSerializer
