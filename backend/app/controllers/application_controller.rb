# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandler
  include PaginateHelper
  include ResponseHelper

  respond_to :json
end
