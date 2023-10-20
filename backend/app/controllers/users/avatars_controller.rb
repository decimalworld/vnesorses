# frozen_string_literal: true

module Users
  class AvatarsController < ApplicationController
    before_action :authorize_user!

    def update
      user_profile = current_user.user_profile
      user_profile
        .create_avatar
        .generate_signed_url
      render json: json_with_success(
        user_profile,
        {
          serializer: UserProfileSerializer
        }
      )
    end
  end
end
