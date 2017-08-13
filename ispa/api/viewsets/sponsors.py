from rest_framework import viewsets

from api.serializers import SponsorSerializer
from core.models import Sponsor


class SponsorViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.
    """
    queryset = Sponsor.objects.all()
    serializer_class = SponsorSerializer
