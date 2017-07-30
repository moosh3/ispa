from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from .models import Member

class MemberInline(admin.StackedInline):
    model = Member
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
