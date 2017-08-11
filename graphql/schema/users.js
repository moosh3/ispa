import {
  GraphQLList,
  GraphQLObjectType,
  GraphQLString,
} from 'graphql';

export const UserType = new GraphQLObjectType({
    name: "User",
    description: "A user within the ISPA platform",
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

export const allUsers = {
    description: "Load all users",
    type: new GraphQLList(UserType),
    resolve: () => fetchUsers(),
};

export const user = {
    description: "Load a specific user",
    type: UserType,
    id: {
        description: "The event token",
        type: GraphQLString,
    },
    resolve: ({ id }) => fetchUser(id),
};
