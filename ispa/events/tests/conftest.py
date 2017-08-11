from pytest_factoryboy import register

from .factories import (
    UserFactory,
    EventFactory,
    EventLocationFactory,
    AttendeeFactory,
    OwnerFactory,
    AttendeeWithEventFactory,
    OwnerWithEventFactory
)


register(EventFactory)
register(EventLocationFactory)
register(UserFactory)
register(AttendeeFactory)
register(OwnerFactory)
register(AttendeeWithEventFactory)
register(OwnerWithEventFactory)
