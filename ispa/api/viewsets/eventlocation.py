from rest_framework import viewsets

from api.serializers import EventLocationSerializer
from events.models import EventLocation


class EventLocationViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.
    """
    queryset = EventLocation.objects.all()
    serializer_class = EventLocationSerializer
