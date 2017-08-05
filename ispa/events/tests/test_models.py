import pytest
from . import BaseTestCase, SymbolDict

from events import models
from . import factories

class TestEventModel(BaseTestCase):

    def test_create_event(self):
        event = SymbolDict(**self.default_event_kwargs)
        self.assertEqual(event.name, 'Test Event')


class TestEventLocationModel(BaseTestCase):

    def test_create_event_location(self):
        self.eventlocation = models.EventLocation.create_location(
            **self.default_event_location_kwargs
        )
        self.assertEqual(self.location.address, '1234 Main St.')
        self.assertEqual(
            self.location.__str__(),
            '1234 Main St.'
        )

    def test_symbol_dict(self):
        x = SymbolDict(foo=1, bar='2')
        assert x.foo == 1

@pytest.fixture
def test_event(event):
    assert isinstance(event, models.Event)
