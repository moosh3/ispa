from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from .models import Event, EventLocation, Owner

class OwnerInline(admin.TabularInline):
    model = Owner

class EventAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    inlines = [OwnerInline, ]

admin.site.register(Event, EventAdmin)
admin.site.register(EventLocation)
admin.site.register(Owner)
