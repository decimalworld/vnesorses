# frozen_string_literal: true

class BlogsController < ApplicationController
  include ERB::Util

  def show
    render json: json_with_success(
      current_blog,
      {
        serializer: BlogSerializer
      }
    )
  end

  def create
    blog = Blog.create
    Image.import(
      ([{ type: Images::Body.name, blog_id: blog.id }] * body_image_count.to_i)
      .append({ type: Images::Cover.name, blog_id: blog.id }),
      all_or_none: true
    )
    render json: blog.tap(&:generate_signed_url)
  end

  def update
    current_blog.update(blog_params)
    render json: current_blog
  end

  private

  def current_blog
    @current_blog ||= Blog.find(params[:id])
  end

  def body_image_count
    params.required(:body_image_count)
  end

  def blog_params
    params.required(%i[title body])
    params.permit(:title, :body)
  end
end
