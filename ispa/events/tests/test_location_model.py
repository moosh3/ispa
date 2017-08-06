import pytest
from . import BaseTestCase, SymbolDict

from events import models
from . import factories


class TestEventLocationModel(BaseTestCase):

    @classmethod

    def setUpTestData(cls):
        cls.eventlocation = factories.EventLocationFactory.create()

    def test_create_event_location(self):
        assert self.location.address == '1234 Main St.'
        assert self.location.__str__(), '1234 Main St.'


    def test_symbol_dict(self):
        x = SymbolDict(foo=1, bar='2')
        assert x.foo == 1
