# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    categories = Category.fetch_page(paginate_params)
    render json: json_with_pagination(
      categories,
      {
        each_serializer: CategorySerializer
      }
    )
  end

  def blogs
    data = category.blogs.fetch_page(paginate_params)
    render json: json_with_pagination(
      data,
      {
        each_serializer: BlogSerializer::SummarySerializer
      }
    )
  end

  private

  def category
    @category ||= Category.find(params[:category_id] || params[:id])
  end
end
