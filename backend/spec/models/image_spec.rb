# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id             :uuid             not null, primary key
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_type :string
#  imageable_id   :uuid
#
require 'rails_helper'

RSpec.describe Image do
  let(:image) { build(:image) }

  describe 'validation' do
    it do
      expect(image).to belong_to(:imageable).optional
    end
  end
end
