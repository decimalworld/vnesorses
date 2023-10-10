# frozen_string_literal: true

module BlogSerializer
  class TitleNewsSerializer < ActiveModel::Serializer
    attributes :id, :title
    has_one :cover
  end
end
