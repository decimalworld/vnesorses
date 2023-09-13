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
#
class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :cover
  has_many :images
end
