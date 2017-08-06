export const UserType = new GraphQLObjectType({
    name: "user",
    description: "a user within the ispa platform",

    fields: {
        id: {
            type: GraphQLString,
            resolve: source -> source.token,
        },
        firstName: { type: GraphQLString },
        lastName: { type: GraphQLString },
        email: { type: GraphQLString },
    },
});
