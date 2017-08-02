from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

from wagtail.wagtailadmin import urls as wagtailadmin_urls
from wagtail.wagtaildocs import urls as wagtaildocs_urls
from wagtail.wagtailcore import urls as wagtail_urls
from graphene_django.views import GraphQLView

from ispa_app.views import AboutView, HomeView
from events.views import EventDashboard

if settings.DEBUG:
    import debug_toolbar


urlpatterns = [
    # Wagtail admin
    url(r'^admin/', admin.site.urls),
    # Wagtail urls
    url(r'^cms/', include(wagtailadmin_urls)),
    url(r'^documents/', include(wagtaildocs_urls)),
    url(r'^pages/', include(wagtail_urls)),
    # django-debug-toolbar
    url(r'^__debug__/', include(debug_toolbar.urls)),
    # Custom
    url('^$', HomeView.as_view(), name='home-view'),
    url(r'^about/', AboutView.as_view(), name='about-view'),
    url(r'^events/$', EventDashboard.as_view(), name='event-view'),
    url(r'^graphql', GraphQLView.as_view(graphiql=True)),
    # Celery job api
    url(r'^api-auth/', include('rest_framework.urls',
        namespace='rest_framework'))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
