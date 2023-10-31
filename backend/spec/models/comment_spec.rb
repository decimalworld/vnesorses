# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment do
  let(:comment) { create(:comment) }

  describe 'association' do
    it { expect(comment).to belong_to(:user) }
    it { expect(comment).to belong_to(:blog) }
  end
end
