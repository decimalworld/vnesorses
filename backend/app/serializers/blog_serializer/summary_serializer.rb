# frozen_string_literal: true

module BlogSerializer
  class SummarySerializer < ApplicationSerializer
    attributes :id, :summary, :title
    has_one :cover
  end
end
