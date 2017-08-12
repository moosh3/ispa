from django.conf.urls import url, include
from django.conf import settings
from django.views.generic import TemplateView

from core import views

urlpatterns = [
    url(r'^$', TemplateView.as_view(
        template_name='ispa/index.html'),
        name='home'),
    url(r'^about/', TemplateView.as_view(
        template_name='ispa/about.html'),
        name='about'),
    url(r'^dues/', views.pay_dues, name='dues')
]
