# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic import TemplateView

# Create your views here.
class PayDuesView(TemplateView):
    template_name = 'ispa/dues.html'

pay_dues = PayDuesView.as_view()
