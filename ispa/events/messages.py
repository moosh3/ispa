from __future__ import unicode_literals

from django.utils.encoding import python_2_unicode_compatible
from django import forms

from events.models import Message


@python_2_unicode_compatible
class CommentForm(forms.Form):
    text = forms.CharField(initial='Type here')
