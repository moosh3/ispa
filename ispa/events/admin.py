from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from events import models

class OwnerInline(admin.TabularInline):
    model = models.Owner

class EventAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    inlines = [OwnerInline, ]

# Register your models here.
admin.site.register(models.Event, EventAdmin)
admin.site.register(models.EventLocation)
admin.site.register(models.Owner)
