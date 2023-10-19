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
require 'rails_helper'

RSpec.describe UserProfile do
  let(:user_profile) { create(:user_profile) }

  describe 'association' do
    it do
      expect(user_profile).to belong_to(:user)
      expect(user_profile).to have_one(:avatar).dependent(:destroy)
      expect(user_profile).to delegate_method(:email).to(:user)
      expect(user_profile).to delegate_method(:password).to(:user)
    end
  end
end
