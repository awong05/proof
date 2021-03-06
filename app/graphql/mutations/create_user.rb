module Mutations
  class CreateUser < BaseMutation
    argument :name,          String,                       required: true
    argument :auth_provider, Types::AuthProviderInputType, required: true

    field :user,   Types::UserType, null: true
    field :errors, [String],        null: false

    def resolve name:, auth_provider:
      user = User.new(
        name: name,
        email: auth_provider.email,
        password: auth_provider.password
      )

      if user.save
        {
          user:   user,
          errors: []
        }
      else
        {
          user:   nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
