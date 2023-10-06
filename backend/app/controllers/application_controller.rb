# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandler
  include ResponseHelper
  respond_to :json
end
