# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandler
  include PaginateHelper
  include ResponseHelper

  respond_to :json

  def ip_addr
    request.headers['RemoteAddress']
  end

  def user_authenticatable?
    request.headers['Authorization'].present?
  end
end
