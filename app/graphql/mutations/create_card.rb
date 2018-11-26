module Mutations
  class CreateCard < BaseMutation
    argument :overview, String, required: true

    field :card,   Types::CardType, null: true
    field :errors, [String],        null: false

    def resolve overview:
      card = Card.new overview: overview
      if card.save
        {
          card:   card,
          errors: []
        }
      else
        {
          comment: nil,
          errors:  card.errors.full_messages
        }
      end
    end
  end
end
