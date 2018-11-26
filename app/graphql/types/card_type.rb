module Types
  class CardType < BaseObject
    field :overview, String,   null: false
    field :user,     UserType, null: true
  end
end
