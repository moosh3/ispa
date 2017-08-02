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
from graphene_django.views import GraphQLView

from events.views import events

if settings.DEBUG:
    import debug_toolbar

# General
urlpatterns = [
    url('^$', TemplateView.as_view(
        template_name='ispa/index.html'),
        name='index'),
    url(r'^about/', TemplateView.as_view(
        template_name='ispa/about.html'),
        name='about'),
]

# Wagtail
urlpatterns += [
    url(r'^admin/', admin.site.urls),
    url(r'^cms/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^pages/', include(wagtail_urls)),
]

# Events
urlpatterns += [
    url(r'^events/$', events.dashboard_view, name='event-dashboard'),
    url(r'^events/list/$', events.list_view, name='event-list'),
    url(r'^events/create/$', events.create_view, name='event-create'),
    url(
        r'^events/(?P<event_slug>[\w-]+)/$',
         events.detail_view,
         name='event-detail'
    ),
    url(
        r'^events/(?P<event_slug>[\w-]+)/edit/$',
         events.edit_view,
         name='event-edit'
    ),
]

# django-debug-toolbar
urlpatterns += [
    url(r'^__debug__/', include(debug_toolbar.urls)),
]

# API and GraphQL
urlpatterns += [
    url(r'^graphql', GraphQLView.as_view(graphiql=True)),
    # Celery job api
    url(r'^api-auth/', include('rest_framework.urls',
        namespace='rest_framework'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
