# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Likes::Anonymous do
  let(:like) { create(:like, :anonymous) }

  describe 'validation' do
    it do
      expect(like).to validate_presence_of(:ip_addr)
    end
  end

  describe 'association' do
    it do
      expect(like).to belong_to(:user).optional
    end
  end
end
