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
FactoryBot.define do
  factory :user_profile do
    user
  end
end
