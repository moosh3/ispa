from django.conf.urls import url
from django.views.generic import TemplateView

from core.views import sponsors

urlpatterns = [
    url(r'^$', TemplateView.as_view(
        template_name='ispa/index.html'),
        name='home'),
    url(r'^about/$', TemplateView.as_view(
        template_name='ispa/about.html'),
        name='about'),
    url(r'^sponsors/$', sponsors.list_view, name='list-sponsors'),
    url(r'^sponsor/create/$', sponsors.create_view, name='create-sponsor')
]
