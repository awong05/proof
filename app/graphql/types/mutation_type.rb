module Types
  class MutationType < BaseObject
    field :create_card, mutation: Mutations::CreateCard
  end
end
