from django.db import models

from core.models import BaseModel

class EventType(BaseModel):

    REQUIRED = 'required'
    OPTIONAL = 'optional'

    MEETING = 'meeting'
    EVENT = 'event'
