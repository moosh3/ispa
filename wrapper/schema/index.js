import { GraphQLSchema, GraphQLObjectType } from "graphql";

import { allUsers, user } from "./users";

const QueryType = new GraphQLObjectType({
    name: "ISPA",
    description: "ISPA GraphQL API",
    fields: () => ({
        allUsers,
        user,
    }),
});

export default new GraphQLSchema({
    query: QueryType,
});
