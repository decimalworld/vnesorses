# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile do
  let(:user_profile) { create(:user_profile) }

  describe 'association' do
    it do
      expect(user_profile).to belong_to(:user)
      expect(user_profile).to delegate_method(:email).to(:user)
      expect(user_profile).to delegate_method(:password).to(:user)
    end
  end
end
