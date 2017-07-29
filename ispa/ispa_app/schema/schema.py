from graphene import ObjectType, Node, Schema
from graphene_django.fields import DjangoConnectionField
from graphene_django.types import DjangoObjectType

from events.models import Event, EventLocation


class EventNode(DjangoObjectType):

    class Meta:
        model = Event
        interfaces = (Node, )

class EventLocationNode(DjangoObjectType):

    class Meta:
        model = EventLocation
        interfaces = (Node, )

class Query(ObjectType):
    event = Node.Field(EventNode)
    all_events = DjangoConnectionField(EventNode)

    eventlocation = Node.Field(EventLocationNode)
    all_eventlocations = DjangoConnectionField(EventLocationNode)

schema = Schema(query=Query)
