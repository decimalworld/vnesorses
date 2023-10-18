# frozen_string_literal: true

# == Schema Information
#
# Table name: user_profiles
#
#  id                :uuid             not null, primary key
#  name              :string
#  two_fator_auth    :boolean          default(FALSE)
#  date_of_birth     :datetime
#  integer           :integer
#  personal_phone    :string
#  address           :string
#  degree            :string
#  job               :string
#  level             :string
#  company_expertise :string
#  monthly_income    :string
#  user_id           :uuid
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class UserProfile < ApplicationRecord
  belongs_to :user

  delegate :password, to: :user
  delegate :email, to: :user

  has_one :avatar, class_name: Images::Avatar.name, as: :imageable, dependent: :destroy

  def avatar_link
    avatar.full_path
  end

  def avatar
    super || Images::Avatar.default
  end
end
