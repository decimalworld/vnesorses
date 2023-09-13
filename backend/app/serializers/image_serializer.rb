# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id         :uuid             not null, primary key
#  blog_id    :uuid
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ImageSerializer < ActiveModel::Serializer
  attributes :id, :full_path, :type
  attribute :signed_url, if: :with_signed_url?

  def with_signed_url?
    !object.signed_url.nil?
  end
end
