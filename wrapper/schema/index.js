import { GraphQLSchema, GraphQLObjectType } from "graphql";

import { allUsers, user, allLocations, location } from "./users";

const QueryType = new GraphQLObjectType({
    name: "ISPA",
    description: "ISPA GraphQL API",
    fields: () => ({
        allUsers,
        user,
        allLocations,
        location,
    }),
});

export default new GraphQLSchema({
    query: QueryType,
});
