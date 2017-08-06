import { GraphQLSchema, GraphQLObjectType } from "graphql";

import { allUsers, user } from "./users";
import { allLocations, location } from "./locations";
import { allEvents, event } from "./events";

const QueryType = new GraphQLObjectType({
    name: "ISPA",
    description: "ISPA GraphQL API",
    fields: () => ({
        allUsers,
        user,
        allLocations,
        location,
        allEvents,
        event,
    }),
});

export default new GraphQLSchema({
    query: QueryType,
});
