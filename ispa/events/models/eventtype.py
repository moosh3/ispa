from django.db import models

from core.models import BaseModel

class EventType(BaseModel):

    REQUIRED = 'REQUIRED'
    OPTIONAL = 'OPTIONAL'
    
    MEETING = 'MEETING'
    EVENT = 'EVENT'
    SEMESTER = 'SEMESTER'
