# frozen_string_literal: true

module Blogs
  class CommonsController < ApplicationController
    include ERB::Util

    def index
      render json: json_with_pagination(
        Blog.normal.order(:created_at).fetch_page(paginate_params),
        { each_serializer: BlogSerializer::SummarySerializer }
      )
    end

    def show
      render json: json_with_success(
        current_blog,
        {
          serializer: BlogSerializer::CommonSerializer
        }
      )
    end

    def create
      blog = CreateBlogService.execute(body_image_count, tag_name)
      render json: json_with_success(
        blog.tap(&:generate_signed_url),
        serializer: BlogSerializer::CommonSerializer
      )
    end

    def update
      current_blog.update(blog_params)
      render json: json_with_success(
        current_blog,
        serializer: BlogSerializer::CommonSerializer
      )
    end

    private

    def current_blog
      @current_blog ||= Blog.find(params[:id])
    end

    def body_image_count
      params.required(:body_image_count)
    end

    def tag_name
      params.required(:tag_name)
    end

    def blog_params
      params.required(%i[title body])
      params.permit(:title, :body)
    end
  end
end
