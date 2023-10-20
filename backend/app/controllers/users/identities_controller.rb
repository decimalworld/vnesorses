# frozen_string_literal: true

module Users
  class IdentitiesController < ApplicationController
    before_action :authorize_user!

    def show
      render json: json_with_success(
        current_user,
        {
          serializer: UserSerializer
        }
      )
    end
  end
end
