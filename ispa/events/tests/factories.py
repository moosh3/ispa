import factory
from faker import Factory as FakerFactory
from django.conf import settings
faker = FakerFactory.create()

class UserFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = settings.AUTH_USER_MODEL

    username = factory.Sequence(lambda n: "User %03d" % n)
    email = factory.LazyAttribute(lambda obj: '%s@example.com' % obj.username)

    @classmethod
    def _generate(cls, create, attrs):
        """Override the default _generate() to set the password."""
        user = super()._generate(create, attrs)
        user.set_password('password')
        user.save()
        return user

class EventLocationFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'events.EventLocation'

    address = factory.LazyAttribute(lambda x: faker.street_name())
    address2 = factory.LazyAttribute(lambda x: faker.secondary_address())
    city = factory.LazyAttribute(lambda x: faker.city())
    state = factory.LazyAttribute(lambda x: faker.state())
    zipcode = factory.LazyAttribute(lambda x: faker.zipcode())


class EventFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'events.Event'

    name = factory.LazyAttribute(lambda x: faker.name())
    # Outbound FK
    location = factory.SubFactory(EventLocationFactory)
    points = factory.LazyAttribute(lambda x: faker.random_digit())


class AttendeeFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'events.Attendance'

    user = factory.SubFactory(UserFactory)
    event = factory.SubFactory(EventFactory)


class OwnerFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'events.Owner'

    user = factory.SubFactory(UserFactory)
    event = factory.SubFactory(EventFactory)


class AttendeeWithEventFactory(UserFactory):
    event = factory.RelatedFactory(AttendeeFactory, 'user')


class OwnerWithEventFactory(UserFactory):
    event = factory.RelatedFactory(OwnerFactory, 'user')
