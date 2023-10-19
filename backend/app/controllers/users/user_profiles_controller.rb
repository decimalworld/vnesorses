# frozen_string_literal: true

module Users
  class UserProfilesController < ApplicationController
    before_action :authorize_user!

    def index
      data = current_user.user_profile
      render json: json_with_success(
        data,
        {
          serializer: UserProfileSerializer
        }
      )
    end
  end
end
