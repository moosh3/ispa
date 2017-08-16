import factory
from faker import Factory as FakerFactory
from django.conf import settings
from django.contrib.auth.models import User
faker = FakerFactory.create()


class UserFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = User

    username = factory.Sequence(lambda n: "user_%d" % n)
    # We pass in 'user' to link the generated Profile to our just-generated User
    # This will call ProfileFactory(user=our_new_user), thus skipping the SubFactory.


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

    name = factory.LazyAttribute(lambda x: faker.credit_card_provider(card_type=None))
    # Outbound FK
    location = factory.SubFactory(EventLocationFactory)
    points = factory.LazyAttribute(lambda x: faker.random_digit())
    # Attendee subclasse below
    # Owners subclass below
    date = factory.LazyAttribute(lambda x: faker.date(pattern="%Y-%m-%d"))
    is_active = True
    description = factory.LazyAttribute(
        lambda x: faker.sentence(
            nb_words=6, variable_nb_words=True, ext_word_list=None
        )
    )

class AttendeeFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = 'events.Attendance'

    user = factory.SubFactory(UserFactory)
    event = factory.SubFactory(EventFactory)


class AttendeeWithEventFactory(UserFactory):
    event = factory.RelatedFactory(AttendeeFactory, 'user')
