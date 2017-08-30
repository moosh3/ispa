from django.views.generic import TemplateView
# from django.shortcuts import render


class BlogIndexView(TemplateView):
    template_name = 'blog/blog_index_page.html'
