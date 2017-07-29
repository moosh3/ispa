from graphene import ObjectType, Node, Schema
from graphene_django.fields import DjangoConnectionField
from graphene_django.types import DjangoObjectType

from events.models import Event


class EventNode(DjangoObjectType):

    class Meta:
        model = Event
        interfaces = (Node, )

class Query(ObjectType):
    event = Node.Field(EventNode)
    all_events = DjangoConnectionField(EventNode)

schema = Schema(query=Query)
