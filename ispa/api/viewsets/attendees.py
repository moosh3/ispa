from rest_framework import viewsets
from rest_framework import mixins

from events.models import Attendance
from api.serializers import AttendeeSerializer


class AttendanceViewSet(mixins.CreateModelMixin,
                                mixins.ListModelMixin,
                                mixins.RetrieveModelMixin,
                                viewsets.GenericViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Attendance.objects.all()
    serializer_class = AttendeeSerializer
