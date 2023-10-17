# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  delegate :password, to: :user
  delegate :email, to: :user

  attribute :avatar_link, default: -> { ENV.fetch('USER_AVATAR_DEFAULT', '') }
end
