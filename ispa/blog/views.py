from django.shortcuts import render
from django.views.generic import TemplateView

from .models import BlogIndexPage

# Create your views here.

class BlogIndexView(TemplateView):
    template_name = 'blog/blog_index_page.html'
