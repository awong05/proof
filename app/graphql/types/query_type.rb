module Types
  class QueryType < Types::BaseObject
    field :cards, [Types::CardType], null: false,
      description: 'Cards'

    def cards
      Card.all
    end
  end
end
