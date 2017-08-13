from rest_framework import viewsets

from api.serializers import SpeakerSerializer
from events.models import Speaker


class SpeakerViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.
    """
    queryset = Speaker.objects.all()
    serializer_class = SpeakerSerializer
