# frozen_string_literal: true

module Paginable
  extend ActiveSupport::Concern

  class_methods do
    def fetch_page(paginate_params)
      page = paginate_params[:page] || 1
      per = paginate_params[:per] || 25
      page(page).per(per)
    end
  end
end
