# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-08-09 00:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('events', '0006_auto_20170809_0022'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='bio',
            field=models.TextField(blank=True, null=True),
        ),
    ]
