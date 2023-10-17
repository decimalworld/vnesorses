# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandler
  include PaginateHelper
  include ResponseHelper
  include AuthorizationHelper

  respond_to :json
end
