# frozen_string_literal: true

module Users
  class ConfirmationsController < Devise::ConfirmationsController
    def show
      self.resource = User.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      raise ActiveRecord::RecordInvalid, resource unless resource.errors.empty?

      options = {
        serializer: UserSerializer,
        message: 'Activated successfully'
      }
      render json: json_with_success(resource, options)
    end
  end
end
