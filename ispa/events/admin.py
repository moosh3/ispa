from django.contrib import admin

from events.models import (
    Event,
    EventLocation,
    UserProfile,
    Speaker,
    Announcement,
    Attendance,
    Message
)

class AttendanceInline(admin.TabularInline):
    model = Attendance

class EventAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    inlines = [AttendanceInline, ]

class SpeakerAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}

# Register your models here.
admin.site.register(Event, EventAdmin)
admin.site.register(EventLocation)
admin.site.register(UserProfile)
admin.site.register(Speaker, SpeakerAdmin)
admin.site.register(Announcement)
admin.site.register(Message)
