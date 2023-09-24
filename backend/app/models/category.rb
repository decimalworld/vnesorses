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
class Category < ApplicationRecord
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags

  validates :name, uniqueness: true, presence: true
end
