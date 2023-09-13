# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActionController::ParameterMissing, with: :unprocessable_response
  end

  def unprocessable_response(error)
    render json: { error_message: error.message }, status: :unprocessable_entity
  end
end
