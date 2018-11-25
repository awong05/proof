module Types
  class QueryType < BaseObject
    field :cards, [CardType], null: false,
      description: 'Cards'

    def cards
      Card.all
    end
  end
end
