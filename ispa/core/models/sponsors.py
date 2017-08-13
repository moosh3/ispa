from django.db import models
from django.core.urlresolvers import reverse
from django.utils.text import slugify

from events.models.base import BaseModel

def image_field(instance, filename):
    return os.path.join('core', str(instance.user.pk), filename)


class Sponsor(BaseModel):

    name = models.CharField(max_length=128, null=True, blank=True)
    image = models.ImageField(upload_to=image_field, null=True, blank=True)
    description = models.CharField(max_length=512, null=True, blank=True)
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)


    def get_absolute_url(self):
        return reverse('sponsor-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    def __unicode__(self):
        return __str__()

    @classmethod
    def create_sponsor(cls, name, image, description, slug):
        return cls.objects.create(
            name=name,
            image=image,
            description=description,
            slug=slug,
        )

    class Meta:
        ordering = ('name',)
