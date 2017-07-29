from django.db import models


class EventType(models.Model):

    REQUIRED = 'REQUIRED'
    OPTIONAL = 'OPTIONAL'

    MEETING = 3
    EVENT = 8
    SEMESTER = 5

    EVENT_TYPES = (
        ('meeting', 'MEETING'),
        ('event', 'EVENT'),
        ('semester', 'SEMESTER')
    )

    category = models.CharField(choices=EVENT_TYPES, default="event", max_length=10)
