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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token, :avatar_link, :created_at, :updated_at
  attribute :token, unless: :token_blank?
  attribute :confirmation_token, if: :id_previously_changed?

  delegate :id_previously_changed?, to: :object

  def avatar_link
    object.avatar.full_path
  end

  def token_blank?
    object.token.blank?
  end
end
