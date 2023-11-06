# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Likes::Identified do
  let(:like) { create(:like, :identified) }

  describe 'validation' do
    it do
      expect(like).not_to validate_presence_of(:ip_addr)
    end
  end

  describe 'association' do
    it do
      expect(like).to belong_to(:user)
    end
  end
end
