# frozen_string_literal: true

module Blogs
  class CommentsController < ApplicationController
    def index
      render json: json_with_pagination(
        current_blog.comments.fetch_page(paginate_params),
        { each_serializer: BlogSerializer::CommentSerializer }
      )
    end

    private

    def current_blog
      @current_blog ||= Blog.find(params[:blog_id])
    end
  end
end
