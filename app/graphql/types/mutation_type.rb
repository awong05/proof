module Types
  class MutationType < Types::BaseObject
    field :create_card, mutation: Mutations::CreateCard
  end
end
