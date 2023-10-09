# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  class Unauthorized < StandardError; end

  included do
    rescue_from ActionController::ParameterMissing, with: :unprocessable_response
    rescue_from ErrorHandler::Unauthorized, with: :unauthorized_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_response
    rescue_from ActiveRecord::RecordNotFound, with: :unprocessable_response
  end

  def unprocessable_response(error)
    render json: { error_message: error.message }, status: :unprocessable_entity
  end

  def unauthorized_response(error)
    render json: { error_message: error.message }, status: :unauthorized
  end
end
