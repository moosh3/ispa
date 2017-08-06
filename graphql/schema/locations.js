import {
  GraphQLList,
  GraphQLObjectType,
  GraphQLSchema,
  GraphQLString,
} from 'graphql';

import {
  fetchLocations,
  fetchLocation,
} from "../resolver/locations";

const LocationType = new GraphQLObjectType({
  name: 'LocationType'
  description: 'GraphQL object representation of a location'
  fields: () => ({
    id: {
      type: GraphQLString,
      resolve: source => source.token,
    },
    address: { type: GraphQLString },
    address2: { type: GraphQLString },
    city: { type: GraphQLString },
    state: { type: GraphQLString },
    zipcode: { type: GraphQLString },
  }),
});


export const allLocations: {
  type: new GraphQLList(LocationType),
  resolve: () => fetchLocations(),
};

export const location: {
  type: LocationType,
  id: { type: GraphQLString },
  resolve: ({id}) => fetchLocation(`${id}`),
};
