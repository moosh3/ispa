from __future__ import unicode_literals
import os

from django.db import models
from django.core.urlresolvers import reverse
from django.utils.encoding import python_2_unicode_compatible

from events.models.base import BaseModel

def image_field(instance, filename):
    return os.path.join('core', str(instance.user.pk), filename)


@python_2_unicode_compatible
class Alumni(BaseModel):

    name = models.CharField(max_length=128, null=True, blank=True)
    image = models.ImageField(upload_to=image_field, null=True, blank=True)
    description = models.CharField(max_length=512, null=True, blank=True)
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)
    extended_description = models.TextField(blank=True, null=True)


    def get_absolute_url(self):
        return reverse('sponsor-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    @classmethod
    def create_alumni(cls, name, image, description, slug):
        return cls.objects.create(
            name=name,
            image=image,
            description=description,
            slug=slug,
        )

    class Meta: # pylint: disable=C1001
        ordering = ('name',)
