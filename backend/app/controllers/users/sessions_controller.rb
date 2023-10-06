# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate(auth_options)
      raise ErrorHandler::Unauthorized, I18n.t('authentication.invalid') unless user_signed_in?

      sign_in(resource_name, resource)
      respond_with(resource)
    end

    private

    def respond_with(resource, opts = {})
      options = {
        **opts,
        serializer: UserSerializer
      }
      render json: json_with_success(resource, options)
    end

    def respond_to_on_destroy
      head :ok
    end
  end
end