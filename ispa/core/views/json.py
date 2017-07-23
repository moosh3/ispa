import json

from django.views.generic import View
from django.http import HttpResponse

class JsonView(View):

    content_type = 'application/json'
    status = None

    def dispatch(self, request, *args, **kwargs):
        response = super(JsonView, self).dispatch(request, *args, **kwargs)
        if isinstance(response, HttpResponse):
            return response
        else:
            return self.render_to_response(response)

    def render_to_response(self, context):
        content = json.dumps(context)
        return HttpResponse(
            content,
            content_type=self.content_type,
            status=self.status,
        )
