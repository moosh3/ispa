import {
  GraphQLObjectType,
  GraphQLEnumType,
  GraphQLList,
  GraphQLSß,
} from "graphql";

import resolveSingleItem from "../utils/resolveSingleItem.";

import { loadLocations, loadLocation } from '../resolver/locations';

export const LocationType = new GraphQLObjectType({
    name: "Location",
    description: "A location from which events are held",

    fields: {
        id: {
            type: GraphQLString,
            resolve: source => source.token,
        },
        address: { type: GraphQLString },
        address2: { type: GraphQLString },
        city: { type: GraphQLString },
        state: { type: GraphQLString },
        zipcode: { type: GraphQLString },
    }
})
const NO_LOAD_REQUIRED = ["id",];

export const allLocations = {
    description: "Load all locations",
    type: new GraphQLList(LocationType),
    resolve: () => loadLocations(),
};

export const location = {
    description: "Load a specifc location",
    type: LocationType,
    args: {
        id: {
            description: "The user token",
            type: GraphQLString,
        },
    },
    resolve: (root, { id }, context, info) => resolveSingleItem(id, () => loadLocation(id), info, NO_LOAD_REQUIRED),
}
