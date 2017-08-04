from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from events import models

class OwnerInline(admin.TabularInline):
    model = models.Owner

class EventAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}
    inlines = [OwnerInline, ]

class MemberInline(admin.StackedInline):
    model = models.Member
    can_delete = False
    verbose_name_plural = 'Member'
    fk_name = 'user'

class CustomUserAdmin(UserAdmin):
    inlines = (MemberInline, )

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)

# Register your models here.
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

admin.site.register(models.Event, EventAdmin)
admin.site.register(models.EventLocation)
admin.site.register(models.Owner)
