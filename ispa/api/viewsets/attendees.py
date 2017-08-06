from rest_framework import viewsets

from events.models import Attendance
from api.serializers import AttendeeSerializer


class AttendanceViewSet(viewsets.ReadOnlyModelViewSet):
    """
    This viewset automatically provides `list` and `detail` actions.
    """
    queryset = Attendance.objects.all()
    serializer_class = AttendeeSerializer
