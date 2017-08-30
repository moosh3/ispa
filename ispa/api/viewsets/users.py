from rest_framework import viewsets

from api.serializers import UserProfileSerializer
from events.models import UserProfile


class UserProfileViewSet(viewsets.ModelViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.

    Additionally we also provide an extra `highlight` action.
    """
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
