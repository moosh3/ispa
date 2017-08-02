# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-08-02 22:42
from __future__ import unicode_literals

from django.db import migrations, models
from django.utils.text import slugify

def add_slugs(apps, schema_editor):
    Event = apps.get_model('events', 'Event')
    for event in Event.objects.all():
        print("Adding slug via name field")
        event.slug = slugify(event.name)
        event.save()


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0003_event_slug'),
    ]

    operations = [migrations.RunPython(add_slugs)
    ]
