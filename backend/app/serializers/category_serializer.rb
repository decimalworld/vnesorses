# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  has_many :tags
  attributes :name
end
