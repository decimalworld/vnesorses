# frozen_string_literal: true

class SummarySerializer < ActiveModel::Serializer
  attributes :id, :summary, :title
  has_one :cover
end
