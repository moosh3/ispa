from django.db import models

from core.models import BaseModel

class EventType(BaseModel):

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
