import {
  GraphQLList,
  GraphQLObjectType,
  GraphQLSchema,
  GraphQLString,
} from 'graphql';

import {
  fetchEvents,
  fetchEvent,
} from "../resolver/events";

import { LocationType } from './locations';

const EventType = new GraphQLObjectType({
  name: 'Event'
  description: 'Returns an events attributes'
  fields: () => ({
    id: {
      type: GraphQLString,
      resolve: source => source.token,
    },
    name: { type: GraphQLString },
    slug: { type: GraphQLString },
    date: { type: GraphQLString },
    description: { type: GraphQLString },
    is_active: {
      type: GraphQLBoolean,
      description: 'True if event is current active',
    },
    location: {
      type: LocationType,
      resolve: source => source,
    },
  }),
});

export const allEvents: {
    type: new GraphQLList(EventType),
    resolve: () => fetchEvents(),
};

export const event: {
    type: EventType,
    id: { type: GraphQLString },
    resolve: ({id}) => fetchEvent(`${id}`),
};
