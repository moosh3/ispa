<<<<<<< HEAD
from django.db import models

from core.models import BaseModel

class EventType(BaseModel):

    REQUIRED = 'required'
    OPTIONAL = 'optional'

    MEETING = 'meeting'
    EVENT = 'event'
=======
from django.db import models

from core.models import BaseModel

class EventType(BaseModel):

    REQUIRED = 'REQUIRED'
    OPTIONAL = 'OPTIONAL'
>>>>>>> 347bcd99a878b6b6da15f733a5ab1146bdf94e91
