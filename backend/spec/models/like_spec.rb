# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like do
  let(:like) { create(:like) }

  describe 'association' do
    it do
      expect(like).to belong_to(:comment)
    end
  end
end
