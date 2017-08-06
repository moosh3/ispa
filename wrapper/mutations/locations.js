import {
    GraphQLInputObjectType,
    GraphQLNonNull,
    GraphQLString,
} from "graphql";

import { LocationType } from "../schema/locations";

import _updateLocation from "../updaters/locations";

export const LocationInputType = new GraphQLInputObjectType({
    name: "LocationInput",
    fields: () => ({
        address: {
            type: GraphQLString,
        },
        address2: {
            type: GraphQLString,
        },
        city: {
            type: GraphQLString,
        },
        state: {
            type: GraphQLString,
        },
        zipcode: {
            type: GraphQLString,
        },
    }),
});

export const updateLocation = {
    description: "Update a specific location"
    type: LocationType,
    args: {
        id: {
            description: "The token for the user to update",
            type: new GraphQLNonNull(GraphQLString),
        },
        location: {
            type: LocationInputType,
        },
    },
    resolve: (root, { id, user }) => _updateLocation(id, user),
},
