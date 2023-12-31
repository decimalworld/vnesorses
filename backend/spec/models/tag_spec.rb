# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id          :uuid             not null, primary key
#  name        :string
#  category_id :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Tag do
  let(:tag) { create(:tag) }

  describe 'validation' do
    it { expect(tag).to validate_uniqueness_of(:name).scoped_to(:category_id) }
  end

  describe 'association' do
    it do
      expect(tag).to belong_to(:category)
      expect(tag).to have_many(:blogs)
    end
  end
end
