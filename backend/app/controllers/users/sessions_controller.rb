# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    private

    def respond_with(resource, opts = {})
      options = {
        **opts,
        serializer: UserSerializer,
        message: 'Login successfully'
      }
      render json: json_with_success(resource, options)
    end

    def respond_to_on_destroy
      options = {
        message: 'Logout successfully'
      }
      render json: json_with_success({}, options), status: :ok
    end
  end
end
