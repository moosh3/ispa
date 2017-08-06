import pytest
from . import BaseTestCase, SymbolDict

from events import models
from . import factories

class TestEventModel(BaseTestCase):

    def test_create_event(self):
        event = SymbolDict(**self.default_event_kwargs)
        assert event.name == 'Test Event'
