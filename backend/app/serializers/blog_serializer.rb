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
  attributes :id, :title, :summary, :body
  has_one :cover
  has_many :images, if: :newly_created?

  def newly_created?
    object.id_previously_changed?
  end
end
