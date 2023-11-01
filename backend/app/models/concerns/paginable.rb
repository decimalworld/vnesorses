# frozen_string_literal: true

module Paginable
  extend ActiveSupport::Concern

  class_methods do
    def fetch_page(paginate_params)
      page = paginate_params[:page] || 1
      per = paginate_params[:per] || 25
      order = try(:paginate_order, paginate_params[:order]) || { created_at: :desc }
      order(**order).page(page).per(per)
    end
  end
end
