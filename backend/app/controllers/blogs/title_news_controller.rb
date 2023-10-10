# frozen_string_literal: true

module Blogs
  class TitleNewsController < ApplicationController
    def index
      data = Blog.title_news.fetch_page({ per: 2 })
      render json: json_with_pagination(data, { each_serializer: BlogSerializer::TitleNewsSerializer })
    end
  end
end
