# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-07-29 03:14
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0003_auto_20170729_0309'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='eventtype',
            name='semester',
        ),
        migrations.AddField(
            model_name='eventtype',
            name='category',
            field=models.CharField(choices=[('meeting', 'MEETING'), ('event', 'EVENT'), ('semester', 'SEMESTER')], default='event', max_length=10),
        ),
    ]
