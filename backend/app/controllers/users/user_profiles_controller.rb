# frozen_string_literal: true

module Users
  class UserProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :confirm_password!, only: :update

    def show
      render json: json_with_success(
        user_profile,
        {
          serializer: UserProfileSerializer
        }
      )
    end

    def update
      current_user.skip_reconfirmation!
      current_user.update!(update_user_params)
      user_profile.update!(update_profile_params)
      render json: json_with_success(
        user_profile,
        {
          serializer: UserProfileSerializer
        }
      )
    end

    private

    def user_profile
      @user_profile ||= current_user.user_profile
    end

    def update_profile_params
      params.permit(:name, :date_of_birth, :personal_phone)
    end

    def update_user_params
      params.permit(:email)
    end

    def confirm_password!
      return unless update_user_params.keys.size.positive?
      raise ErrorHandler::Unauthorized unless current_user.valid_password?(params.require(:password_confirmation))
    end
  end
end
