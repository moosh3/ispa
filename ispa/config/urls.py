from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import TemplateView
from django.contrib.auth.views import (
    login,
    logout_then_login,
    password_reset,
    password_reset_complete,
    password_reset_confirm,
    password_reset_done,
)

from wagtail.wagtailadmin import urls as wagtailadmin_urls
from wagtail.wagtaildocs import urls as wagtaildocs_urls
from wagtail.wagtailcore import urls as wagtail_urls
from wagtail.wagtailsearch import urls as wagtailsearch_urls

from graphene_django.views import GraphQLView
from rest_framework.routers import DefaultRouter
from rest_framework.schemas import get_schema_view

from events.views import events
from api.viewsets import (
    EventViewSet,
    EventLocationViewSet,
    AttendanceViewSet,
)

if settings.DEBUG:
    import debug_toolbar

schema_view = get_schema_view(title='ISPA API')

router = DefaultRouter()
router.register(r'eventsp', EventViewSet)
router.register(r'locationsp', EventLocationViewSet)
router.register(r'attendeesp', AttendanceViewSet)

# General
urlpatterns = [
    url(r'^$', TemplateView.as_view(
        template_name='ispa/index.html'),
        name='home'),
    url(r'^about/', TemplateView.as_view(
        template_name='ispa/about.html'),
        name='about'),
    url(r'^django-admin/', admin.site.urls),
]

# Wagtail
urlpatterns += [
    url(r'^admin/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^pages/', include(wagtail_urls)),
]

# Events
urlpatterns += [
    url(r'^events/$', events.dashboard_view, name='event-dashboard'),
    url(r'^events/list/$', events.list_view, name='event-list'),
    url(r'^events/create/$', events.create_view, name='event-create'),
    url(
        r'^events/(?P<slug>[\w-]+)/$',
         events.detail_view,
         name='event-detail'
    ),
    url(
        r'^events/(?P<slug>[\w-]+)/edit/$',
         events.edit_view,
         name='event-edit'
    ),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# django-debug-toolbar
urlpatterns += [
    url(r'^__debug__/', include(debug_toolbar.urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# API and GraphQL
urlpatterns += [
    url(r'^graphql', GraphQLView.as_view(graphiql=True)),
    url(r'^api/', include(router.urls)),
    url(r'^schema/$', schema_view),
    #url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^auth/', include('rest_auth.urls')),
    url(r'^auth/registration/', include('rest_auth.registration.urls')),
]
