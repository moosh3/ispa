from django.db import models
from django.core.urlresolvers import reverse
from django.utils.text import slugify

from events.models.base import BaseModel


class Announcement(BaseModel):

    title = models.CharField(max_length=128, null=True, blank=True)
    text = models.TextField(null=True, blank=True)
    slug = models.SlugField(unique=True, max_length=40,
                            blank=True, null=True)


    def get_absolute_url(self):
        return reverse('announcement-detail', args=[self.slug])

    def __str__(self):
        return '{}'.format(self.name)

    def __unicode__(self):
        return __str__()

    @classmethod
    def announcement(cls, title, text, slug):
        return cls.objects.create(
            title=title,
            text=text,
            slug=slug,
        )

    class Meta:
        ordering = ('title',)
