# frozen_string_literal: true

# == Schema Information
#
# Table name: user_profiles
#
#  id                :uuid             not null, primary key
#  name              :string
#  two_fator_auth    :boolean          default(FALSE)
#  date_of_birth     :datetime
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
class UserProfileSerializer < ApplicationSerializer
  attributes  :id, :email, :account_name, :name, :two_fator_auth,
              :date_of_birth, :personal_phone,
              :address, :degree, :created_at,
              :job, :level, :company_expertise, :monthly_income
  has_one :avatar

  def account_name
    object.email.match(/^[^\@]*/).to_s
  end
end
