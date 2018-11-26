module Mutations
  class SignInUser < BaseMutation
    argument :auth_provider, Types::AuthProviderInputType, required: true

    field :token,  String,          null: true
    field :user,   Types::UserType, null: true

    def resolve auth_provider:
      email = auth_provider.email
      return unless email

      user = User.find_by_email email

      return unless user
      return unless user.authenticate auth_provider.password

      encryptor = ActiveSupport::MessageEncryptor.new Rails.application.credentials.secret_key_base.byteslice 0..31
      token     = encryptor.encrypt_and_sign "user-id:#{user.id}"

      OpenStruct.new(
        user:  user,
        token: token
      )
    end
  end
end
