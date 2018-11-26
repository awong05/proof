module Mutations
  class CreateCard < BaseMutation
    argument :overview, String, required: true

    field :card,   Types::CardType, null: true
    field :errors, [String],        null: false

    def resolve overview:
      card = Card.new overview: overview, user: context[:current_user]
      if card.save
        {
          card:   card,
          errors: []
        }
      else
        {
          card:   nil,
          errors: card.errors.full_messages
        }
      end
    end
  end
end
