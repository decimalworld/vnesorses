# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category do
  let(:category) { create(:category) }

  describe 'validation' do
    it { expect(category).to validate_uniqueness_of(:name) }
  end

  describe 'association' do
    it { expect(category).to have_many(:tags) }
    it { expect(category).to have_many(:blogs).through(:tags) }
  end
end
