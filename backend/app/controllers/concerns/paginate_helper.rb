# frozen_string_literal: true

module PaginateHelper
  extend ActiveSupport::Concern

  def paginate_params
    params.permit(:page, :per, :order)
  end
end
