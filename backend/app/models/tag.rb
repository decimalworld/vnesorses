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
class Tag < ApplicationRecord
  belongs_to :category
  has_many :blogs, dependent: :destroy

  validates :name, uniqueness: { scope: :category_id }, presence: true
end
