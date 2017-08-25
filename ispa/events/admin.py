from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from events import models

class AttendanceInline(admin.TabularInline):
    model = models.Attendance

class EventAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    inlines = [AttendanceInline, ]

class SpeakerAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}

# Register your models here.
admin.site.register(models.Event, EventAdmin)
admin.site.register(models.EventLocation)
admin.site.register(models.UserProfile)
admin.site.register(models.Speaker, SpeakerAdmin)
admin.site.register(models.Announcement)
