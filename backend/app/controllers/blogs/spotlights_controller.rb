# frozen_string_literal: true

module Blogs
  class SpotlightsController < ApplicationController
    def index
      data = Blog.spotlight.order(:created_at).take!
      render json: json_with_success(
        data,
        {
          serializer: BlogSerializer::SummarySerializer
        }
      )
    end
  end
end
