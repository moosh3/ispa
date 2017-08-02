from django.views.generic import TemplateView


class AboutView(TemplateView):
    template_name = "ispa/about.html"


class HomeView(TemplateView):
    template_name = "ispa/index.html"
