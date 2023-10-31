# frozen_string_literal: true

module Users
  class IdentitiesController < ApplicationController
    before_action :authenticate_user!

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
