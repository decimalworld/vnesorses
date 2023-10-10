# frozen_string_literal: true

# == Schema Information
#
# Table name: blogs
#
#  id         :uuid             not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blog_type  :integer          default("normal")
#  tag_id     :uuid
#
require 'rails_helper'

RSpec.describe Blog do
  let(:blog) { build(:blog) }

  describe 'validation' do
    it do
      expect(blog).to validate_presence_of(:title).on(:update)
      expect(blog).to validate_presence_of(:body).on(:update)
    end
  end

  describe 'association' do
    it do
      expect(blog).to have_one(:cover).class_name(Images::Cover.name).dependent(:destroy)
      expect(blog).to have_many(:images).class_name(Images::Body.name).dependent(:destroy)
      expect(blog).to belong_to(:tag).optional
    end
  end
end
