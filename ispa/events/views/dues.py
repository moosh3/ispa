# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic import TemplateView

# Create your views here.
class PayDuesView(TemplateView):
    # Hidden due to static secret keys
    template_name = 'events/dues.html'

pay_dues = PayDuesView.as_view()
