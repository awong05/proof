module Types
  class MutationType < BaseObject
    field :create_card,  mutation: Mutations::CreateCard
    field :create_user,  mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
