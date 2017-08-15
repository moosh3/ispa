from pytest_factoryboy import register

from .factories import (
    UserFactory,
    EventFactory,
    EventLocationFactory,
    AttendeeFactory,
    AttendeeWithEventFactory,
)


register(EventFactory)
register(EventLocationFactory)
register(UserFactory)
register(AttendeeFactory)
register(AttendeeWithEventFactory)
