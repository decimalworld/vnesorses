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
class CategorySerializer < ActiveModel::Serializer
  has_many :tags
  attributes :name
end
