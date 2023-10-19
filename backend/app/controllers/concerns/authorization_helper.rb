# frozen_string_literal: true

module AuthorizationHelper
  attr_reader :current_user

  def authorize_user!
    token = request.headers['Authorization']
    resource = JWT.decode(token.sub('Bearer ', ''), Rails.application.credentials.devise_jwt_secret)
    @current_user = resource
                    .first
                    .slice('scp', 'sub')
                    .values
                    .then do |resource_name, id|
      resource_name.camelize.constantize.find(id)
    end
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError, NoMethodError
    raise ErrorHandler::InvalidToken
  end
end
