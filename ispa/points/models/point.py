from django.db import models


class Point(models.Model):
    TYPES =  (
        ('3', 'meeting'),
        ('5', 'semester'),
        ('8', 'event'),
    )

    value = models.CharField(max_length=1, choices=TYPES)
