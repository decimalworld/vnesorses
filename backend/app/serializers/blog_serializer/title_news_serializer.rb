# frozen_string_literal: true

module BlogSerializer
  class TitleNewsSerializer < ApplicationSerializer
    attributes :id, :title
    has_one :cover
  end
end
