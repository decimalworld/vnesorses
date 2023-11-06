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
class TagSerializer < ApplicationSerializer
  attributes :id, :name, :url_name

  def url_name
    object.name.gsub(/\s/, '_').underscore.dasherize
  end
end
