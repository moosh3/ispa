# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from core import models

admin.site.register(models.Sponsor)
admin.site.register(models.Alumni)
