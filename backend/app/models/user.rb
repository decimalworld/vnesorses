# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  attr_reader :token

  has_one :user_profile, dependent: :destroy
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :nullify

  delegate :avatar, to: :user_profile
  delegate :name, to: :user_profile

  validates :email, presence: true
  validates :email, uniqueness: true
  before_commit :skip_confirmation_notification!
  before_commit :create_user_profile, if: :id_previously_changed?

  enum status: {
    active: 0,
    deactived: 1
  }

  def on_jwt_dispatch(token, _payload)
    @token = "Bearer #{token}"
  end
end
