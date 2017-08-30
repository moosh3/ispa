# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from core.models import Sponsor, Alumni

class AlumniAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}

admin.site.register(Sponsor)
admin.site.register(Alumni, AlumniAdmin)
